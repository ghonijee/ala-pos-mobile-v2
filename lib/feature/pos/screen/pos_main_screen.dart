import 'package:ala_pos/shared/styles/styles.dart';
import 'package:ala_pos/shared/widget/appbar/appbar_search_component.dart';
import 'package:ala_pos/shared/widget/card/product_item_grid_component.dart';
import 'package:ala_pos/shared/widget/form/text_form_component.dart';
import 'package:ala_pos/shared/widget/tags/tags_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PosMainScreen extends StatelessWidget {
  const PosMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primeTheme = PrimerTheme.of(context);

    return Scaffold(
      backgroundColor: primeTheme.canvas.dflt,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                AppBarSearchComponent(
                  leadingIcon: Icon(FeatherIcons.menu),
                  leadingOnTap: () {
                    //
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
                                  // InkWell(
                                  //   child: Icon(FeatherIcons.list),
                                  // ),
                                  InkWell(
                                    child: Icon(FeatherIcons.grid),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacing.height(
                            size: 16,
                          ),
                          Expanded(
                            child: GridView.builder(
                                itemCount: 10,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: AppSpacings.m,
                                  mainAxisSpacing: AppSpacings.m,
                                ),
                                itemBuilder: (context, index) {
                                  return false
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        )
                                      : InkWell(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
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
                    Text("Total ", style: Theme.of(context).primaryTextTheme.titleMedium),
                    Text("Rp. 120.000 (10 Item)", style: Theme.of(context).primaryTextTheme.titleMedium),
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
