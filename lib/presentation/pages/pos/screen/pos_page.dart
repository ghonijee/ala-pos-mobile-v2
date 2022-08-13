import 'package:ala_pos/presentation/pages/pages.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/scan_product/scan_product_cubit.dart';
import 'package:ala_pos/presentation/widgets/side_menu/widgets/side_menu_widget.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class PosPage extends HookWidget {
  const PosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    var searchHasValue = useState<bool>(false);
    final scrollController = useScrollController();

    var listProductCubit = context.read<ListProductCubit>();
    CartCubit cartCubit = context.read<CartCubit>();
    var scanCubit = context.read<ScanProductCubit>();
    var resumeCubit = BlocProvider.of<TransactionResumeCubit>(context);

    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
        listProductCubit.getProductList(nextPage: true, initialData: false);
      }
    });

    listProductCubit.getProductList(initialData: true);

    return MultiBlocListener(
      listeners: [
        BlocListener<ListProductCubit, ListProductState>(
          listener: (context, state) {
            //
          },
        ),
        BlocListener<ScanProductCubit, ScanProductState>(
          listener: (context, state) {
            state.maybeWhen(orElse: () {
              //
            }, success: (model) {
              cartCubit.add(model);
            });
          },
        ),
      ],
      child: BlocBuilder<ListProductCubit, ListProductState>(
        builder: (context, state) {
          return Scaffold(
            drawer: SideMenuWidget(),
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: Text("Kasir"),
              actions: [],
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
                    padding: EdgeInsets.symmetric(horizontal: AppSpacings.s.sp, vertical: AppSpacings.m.sp),
                    height: 100.h,
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: searchController,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              searchHasValue.value = true;
                            } else {
                              searchHasValue.value = false;
                            }
                          },
                          textAlignVertical: TextAlignVertical.center,
                          onEditingComplete: () {
                            if (searchController.text.isNotEmpty) {
                              listProductCubit.getProductList(value: searchController.text, initialData: true);
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: Icon(
                                searchHasValue.value ? Ionicons.close_outline : Ionicons.search_outline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () {
                                if (searchHasValue.value) {
                                  searchController.clear();
                                  searchHasValue.value = false;
                                  listProductCubit.getProductList(value: '', initialData: true);
                                }
                              },
                            ),
                            suffixIcon: SizedBox(
                              width: 25.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Ionicons.barcode_outline,
                                      color: Theme.of(context).colorScheme.primary,
                                      size: 18.sp,
                                    ),
                                    onPressed: () {
                                      FlutterBarcodeScanner.getBarcodeStreamReceiver(
                                        '#ff6666',
                                        'Kembali',
                                        false,
                                        ScanMode.BARCODE,
                                      )!
                                          .listen((barcode) {
                                        if (barcode != null) {
                                          scanCubit.scan(barcode);
                                          FlutterBeep.beep(true);
                                        }
                                      });
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context.router.pushNamed(RouteName.posCustomProduct);
                                    },
                                    child: Icon(
                                      Ionicons.flash_outline,
                                      color: Theme.of(context).colorScheme.primary,
                                      size: 18.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            hintText: "Nama/Kode Barang",
                          ),
                        ),
                        SizedBox(
                          height: AppSpacings.m.sp,
                        ),
                        state.maybeWhen(
                          notFound: () {
                            return Expanded(
                                child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/empty/search_empty_state.png"),
                                  Text("Produk Belum Tersedia"),
                                  SizedBox(
                                    height: AppSpacings.xl.sp,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(fixedSize: Size(60.w, 35.sp)),
                                    onPressed: () {
                                      context.router.pushNamed(RouteName.product);
                                    },
                                    child: Text("Tambahkan Produk"),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ));
                          },
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
                                  controller: scrollController,
                                  itemCount: nextPage ? data.length + 1 : data.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: AppSpacings.s.sp,
                                    mainAxisSpacing: AppSpacings.s.sp,
                                  ),
                                  itemBuilder: (context, index) {
                                    var item = data[index];
                                    return index >= data.length
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              // Jika store tidak menggunakan stock opname
                                              if (!cartCubit.storeModel.useStockOpname) {
                                                cartCubit.add(item);
                                                return;
                                              }

                                              // Jika store tidak menggunakan stock opname
                                              if (item.stock! > 0) {
                                                cartCubit.add(item);
                                              } else {
                                                SnackbarMessage.failed(context, "Stok product tidak tersedia");
                                              }
                                            },
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
                                  Image.asset("assets/images/empty/product_empty.png"),
                                  Text("Belum ada daftar produk yang tersedia"),
                                  SizedBox(
                                    height: AppSpacings.xl.sp,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(fixedSize: Size(60.w, 35.sp)),
                                    onPressed: () {
                                      context.router.pushNamed(RouteName.product);
                                    },
                                    child: Text("Tambahkan Sekarang"),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
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
                                Text("${state.amountPrice.toIDR()} (${state.countItem} Item)", style: Theme.of(context).primaryTextTheme.titleMedium),
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
      ),
    );
  }
}
