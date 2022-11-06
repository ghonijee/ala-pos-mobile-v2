import 'package:ala_pos/feature/pos/provider/list_product_provider.dart';
import 'package:ala_pos/feature/pos/routes/pos_router.dart';
import 'package:ala_pos/feature/pos/screen/pos_cart_screen.dart';
import 'package:ala_pos/gen/assets.gen.dart';
import 'package:ala_pos/shared/styles/styles.dart';
import 'package:ala_pos/shared/utils/debouncer.dart';
import 'package:ala_pos/shared/utils/extension.dart';
import 'package:ala_pos/shared/widget/appbar/appbar_search_component.dart';
import 'package:ala_pos/shared/widget/card/product_item_grid_component.dart';
import 'package:ala_pos/shared/widget/card/product_item_list_component.dart';
import 'package:ala_pos/shared/widget/form/text_form_component.dart';
import 'package:ala_pos/shared/widget/tags/tags_component.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../side_menu/screen/side_menu_widget.dart';
import '../provider/cart_product_provider.dart';
import '../provider/transaction_provider.dart';
import '../state/cart/cart_state.dart';

enum ViewMode { Grid, List }

class PosMainScreen extends HookConsumerWidget {
  const PosMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    var primeTheme = PrimerTheme.of(context);
    var viewMode = useState(ViewMode.List);
    var _debouncer = Debouncer(milliseconds: 1000);

    var listController = ref.read(listProductProvider.notifier);
    var cartController = ref.read(cartProductProvider.notifier);
    // var listProductState = ref.watch(listProductProvider);

    final searchController = useTextEditingController();
    final scrollController = useScrollController();

    ref.listen<CartState>(cartProductProvider, (previous, next) {
      ref.read(transactionProvider.notifier).init(next.items);
    });

    return RefreshIndicator(
      onRefresh: () => listController.getListProduct(initialData: true),
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        backgroundColor: primeTheme.canvas.dflt,
        drawer: SideMenuView(),
        body: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  AppBarSearchComponent(
                    searchController: searchController,
                    onEditingComplete: () {
                      if (searchController.text.isNotEmpty) {
                        listController.getListProduct(value: searchController.text, initialData: true);
                      }
                    },
                    onChange: (value) {
                      if (value.isEmpty) {
                        listController.getListProduct(initialData: true, value: '');
                      } else {
                        _debouncer.run(() {
                          listController.getListProduct(initialData: true, value: value);
                        });
                      }
                    },
                    leadingIcon: Icon(FeatherIcons.menu),
                    leadingOnTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                      // Scaffold.of(context).openDrawer();
                    },
                    actions: [
                      InkWell(
                        child: Icon(
                          FeatherIcons.camera,
                          color: primeTheme.foreground.dflt,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      child: Container(
                        height: double.infinity,
                        color: primeTheme.canvas.inset,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   height: 32,
                            //   width: 100.w - 32,
                            //   child: ListView(
                            //     scrollDirection: Axis.horizontal,
                            //     // shrinkWrap: true,
                            //     children: [
                            //       TagsComponent(label: "Makanan", isActive: true),
                            //       TagsComponent(label: "Minuman", isActive: false),
                            //       TagsComponent(label: "Minuman", isActive: false),
                            //       TagsComponent(label: "Minuman", isActive: false),
                            //       TagsComponent(label: "Minuman", isActive: false),
                            //       TagsComponent(label: "Minuman", isActive: false),
                            //       TagsComponent(label: "Minuman", isActive: false),
                            //       TagsComponent(label: "Minuman", isActive: false),
                            //       TagsComponent(label: "Minuman", isActive: false),
                            //     ],
                            //   ),
                            // ),
                            // Spacing.height(
                            //   size: 16,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ref.watch(listProductProvider).maybeWhen(
                                      loaded: (data, nextPage, count) {
                                        return Text(
                                          count,
                                          style: primeTheme.typography.smallBold,
                                        );
                                      },
                                      orElse: () => Text(
                                        "Loading...",
                                        style: primeTheme.typography.smallBold,
                                      ),
                                    ),

                                // Mode
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Mode Tampilan",
                                      style: primeTheme.typography.small,
                                    ),
                                    Spacing.width(
                                      size: 8,
                                    ),
                                    viewMode.value == ViewMode.List
                                        ? InkWell(
                                            onTap: () => viewMode.value = ViewMode.Grid,
                                            child: Icon(FeatherIcons.list),
                                          )
                                        : InkWell(
                                            onTap: () => viewMode.value = ViewMode.List,
                                            child: Icon(FeatherIcons.grid),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                            Spacing.height(
                              size: 16,
                            ),
                            ref.watch(listProductProvider).maybeWhen(
                              loaded: (data, nextPage, productCount) {
                                return viewMode.value == ViewMode.Grid
                                    ? Expanded(
                                        child: GridView.builder(
                                            controller: scrollController,
                                            itemCount: nextPage ? data.length + 1 : data.length,
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: AppSpacings.m,
                                              mainAxisSpacing: AppSpacings.m,
                                            ),
                                            itemBuilder: (context, index) {
                                              var item = data[index];
                                              return index >= data.length
                                                  ? Center(
                                                      child: CircularProgressIndicator(
                                                        color: primeTheme.brand.primary,
                                                      ),
                                                    )
                                                  : InkWell(
                                                      onTap: () {
                                                        // Jika store tidak menggunakan stock opname
                                                        if (!item.useStockOpname) {
                                                          cartController.add(item);
                                                          return;
                                                        }

                                                        // Jika store menggunakan stock opname
                                                        if (item.stock! > 0) {
                                                          cartController.add(item);
                                                        } else {
                                                          // SnackbarMessage.failed(context, "Stok product tidak tersedia");
                                                        }
                                                      },
                                                      child: ProductItemGridComponent(productModel: data[index]),
                                                    );
                                            }),
                                      )
                                    : Expanded(
                                        child: ListView.separated(
                                        controller: scrollController,
                                        separatorBuilder: (_, index) => Divider(),
                                        itemCount: nextPage ? data.length + 1 : data.length,
                                        itemBuilder: (context, index) {
                                          var item = data[index];

                                          return index >= data.length
                                              ? Center(
                                                  child: CircularProgressIndicator(
                                                    color: primeTheme.brand.primary,
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    // Jika store tidak menggunakan stock opname
                                                    if (!item.useStockOpname) {
                                                      cartController.add(item);
                                                      return;
                                                    }

                                                    // Jika store menggunakan stock opname
                                                    if (item.stock! > 0) {
                                                      cartController.add(item);
                                                    } else {
                                                      // SnackbarMessage.failed(context, "Stok product tidak tersedia");
                                                    }
                                                  },
                                                  child: ProductItemListComponent(productModel: data[index]));
                                        },
                                      ));
                              },
                              notFound: () {
                                return Expanded(
                                    child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Assets.images.empty.productEmpty.image(),
                                      Text("Produk Belum Tersedia"),
                                      SizedBox(
                                        height: AppSpacings.xl.sp,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(fixedSize: Size(60.w, 35.sp)),
                                        onPressed: () {
                                          // context.router.pushNamed(RouteName.product);
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
                              orElse: () {
                                return Expanded(
                                    child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Assets.images.empty.productEmpty.image(),
                                      Text("Belum ada daftar produk yang tersedia"),
                                      SizedBox(
                                        height: AppSpacings.xl.sp,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(fixedSize: Size(60.w, 35.sp)),
                                        onPressed: () {
                                          // context.router.pushNamed(RouteName.product);
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
                    ),
                  )
                ],
              ),
            ),
            ref.watch(cartProductProvider).items.isEmpty
                ? SizedBox()
                : GestureDetector(
                    onTap: () {
                      context.router.pushNamed(PosRouteName.PosCart);
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl),
                        width: 100.w,
                        height: 70.px,
                        decoration: BoxDecoration(
                          color: primeTheme.brand.primary,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FeatherIcons.shoppingCart, color: primeTheme.foreground.onEmphasis),
                                Spacing.width(),
                                Text("Total ", style: primeTheme.typography.bold.copyWith(color: primeTheme.foreground.onEmphasis)),
                              ],
                            ),
                            Text("${ref.read(cartProductProvider).amountPrice.toIDR()} (${ref.read(cartProductProvider).countItem})",
                                style: primeTheme.typography.h5.copyWith(color: primeTheme.foreground.onEmphasis)),
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
