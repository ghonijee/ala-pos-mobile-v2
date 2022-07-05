import 'package:ala_pos/presentation/pages/pages.dart';
import 'package:ala_pos/presentation/widgets/side_menu/widgets/side_menu_widget.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class PosPage extends HookWidget {
  const PosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final scrollController = useScrollController();

    var listProductCubit = context.read<ListProductCubit>();
    var cartCubit = context.read<CartCubit>();
    var resumeCubit = BlocProvider.of<TransactionResumeCubit>(context);

    listProductCubit.getProductList(initialData: true);

    return BlocConsumer<ListProductCubit, ListProductState>(
      listener: (context, state) {
        //
      },
      builder: (context, state) {
        return Scaffold(
          drawer: SideMenuWidget(),
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text("Alapos"),
            actions: [
              IconButton(
                onPressed: () {
                  context.router.navigateNamed(CartRoute.name);
                },
                icon: Icon(Ionicons.cart_outline),
              )
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(AppSpacings.m.sp),
                  height: 100.h,
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: searchController,
                        style: Theme.of(context).textTheme.bodyText1,
                        onEditingComplete: () {
                          if (searchController.text.isNotEmpty) {
                            listProductCubit.getProductList(value: searchController.text, initialData: true);
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: Icon(
                              Ionicons.search_outline,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Ionicons.barcode_outline,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            onPressed: () {
                              print("qrcode press");
                            },
                          ),
                          hintText: "Nama/Kode Barang",
                        ),
                      ),
                      SizedBox(
                        height: AppSpacings.m.sp,
                      ),
                      state.maybeWhen(
                        loading: () {
                          return Expanded(
                              child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          ));
                        },
                        loaded: (data, nextPage) {
                          return Expanded(
                            child: GridView.builder(
                                controller: scrollController
                                  ..addListener(() {
                                    if (scrollController.offset == scrollController.position.maxScrollExtent &&
                                        listProductCubit.canFetchingData) {
                                      listProductCubit.getProductList(nextPage: true, initialData: false);
                                    }
                                  }),
                                itemCount: nextPage ? data.length + 1 : data.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: AppSpacings.s.sp,
                                  mainAxisSpacing: AppSpacings.s.sp,
                                ),
                                itemBuilder: (context, index) {
                                  return index >= data.length
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () => cartCubit.add(data[index]),
                                          child: ProductContainer(data[index]),
                                        );
                                }),
                          );
                        },
                        orElse: () {
                          return Expanded(
                              child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Produk Belum Tersedia"),
                                IconButton(
                                  onPressed: () async {
                                    await listProductCubit.getProductList(initialData: true);
                                  },
                                  icon: Icon(Ionicons.reload),
                                )
                              ],
                            ),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
                BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    resumeCubit.init(
                      cartCubit.state.items.toList(),
                    );
                  },
                  builder: (context, state) {
                    if (state.items.isEmpty) {
                      return SizedBox();
                    }
                    return GestureDetector(
                      onTap: () {
                        context.router.pushNamed(RouteName.posOrderResume);
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl),
                          width: 100.w,
                          height: 50.sp,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total ", style: Theme.of(context).primaryTextTheme.titleMedium),
                              Text("${state.amountPrice.toIDR()} (${state.countItem} Item)",
                                  style: Theme.of(context).primaryTextTheme.titleMedium),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
