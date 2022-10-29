import 'package:ala_pos/feature/pos/routes/pos_router.dart';
import 'package:ala_pos/feature/pos/screen/pos_cart_screen.dart';
import 'package:ala_pos/shared/styles/styles.dart';
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

enum ViewMode { Grid, List }

class PosMainScreen extends HookConsumerWidget {
  const PosMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    var primeTheme = PrimerTheme.of(context);
    var viewMode = useState(ViewMode.List);

    return Scaffold(
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
                          SizedBox(
                            height: 32,
                            width: 100.w - 32,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              // shrinkWrap: true,
                              children: [
                                TagsComponent(label: "Makanan", isActive: true),
                                TagsComponent(label: "Minuman", isActive: false),
                                TagsComponent(label: "Minuman", isActive: false),
                                TagsComponent(label: "Minuman", isActive: false),
                                TagsComponent(label: "Minuman", isActive: false),
                                TagsComponent(label: "Minuman", isActive: false),
                                TagsComponent(label: "Minuman", isActive: false),
                                TagsComponent(label: "Minuman", isActive: false),
                                TagsComponent(label: "Minuman", isActive: false),
                              ],
                            ),
                          ),
                          Spacing.height(
                            size: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1.000 Produk",
                                style: primeTheme.typography.smallBold,
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
                          viewMode.value == ViewMode.Grid
                              ? Expanded(
                                  child: GridView.builder(
                                      itemCount: 10,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: AppSpacings.m,
                                        mainAxisSpacing: AppSpacings.m,
                                      ),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            // Jika store tidak menggunakan stock opname
                                            // if (!item.useStockOpname) {
                                            //   cartCubit.add(item);
                                            //   return;
                                            // }

                                            // Jika store menggunakan stock opname
                                            // if (item.stock! > 0) {
                                            //   cartCubit.add(item);
                                            // } else {
                                            //   SnackbarMessage.failed(context, "Stok product tidak tersedia");
                                            // }
                                          },
                                          child: ProductItemGridComponent(),
                                        );
                                      }),
                                )
                              : Expanded(
                                  child: ListView.separated(
                                  separatorBuilder: (_, index) => Divider(),
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return ProductItemListComponent();
                                  },
                                )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
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
                    Text("Rp. 120.000 (10 Item)", style: primeTheme.typography.h5.copyWith(color: primeTheme.foreground.onEmphasis)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
