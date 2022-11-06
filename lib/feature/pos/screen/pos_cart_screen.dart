import 'package:ala_pos/feature/pos/provider/cart_product_provider.dart';
import 'package:ala_pos/feature/pos/routes/pos_router.dart';
import 'package:ala_pos/feature/pos/widgets/cart_item_widget.dart';
import 'package:ala_pos/feature/pos/widgets/resume_label_value_widget.dart';
import 'package:ala_pos/gen/assets.gen.dart';
import 'package:ala_pos/shared/styles/app_spacing.dart';
import 'package:ala_pos/shared/widget/button/button_fixed_component.dart';
import 'package:ala_pos/shared/widget/button/button_full_component.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/add_customer_bottom_sheet.dart';
import '../widgets/add_discount_bottom_sheet.dart';

class PosCartScreen extends HookConsumerWidget {
  const PosCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var primerTheme = PrimerTheme.of(context);
    var cartController = ref.read(cartProductProvider.notifier);
    return Scaffold(
      backgroundColor: primerTheme.canvas.dflt,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: primerTheme.canvas.dflt,
                border: Border(
                  bottom: BorderSide(
                    color: primerTheme.border.dflt,
                  ),
                ),
              ),
              height: 56,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Icon(FeatherIcons.arrowLeft),
                  ),
                  Spacing.width(
                    size: 24,
                  ),
                  Text(
                    "Keranjang",
                    style: primerTheme.typography.h4,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                            ),
                            isScrollControlled: true,
                            // isDismissible: true,
                            context: context,
                            builder: (context) {
                              return AddDiscountBottomSheet();
                            },
                          );
                          // context.router.pop();
                        },
                        child: Icon(FeatherIcons.tag),
                      ),
                      Spacing.width(
                        size: 16,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                            ),
                            isScrollControlled: true,
                            // isDismissible: true,
                            context: context,
                            builder: (context) {
                              return AddCustomerBottomSheet();
                            },
                          );
                        },
                        child: Icon(FeatherIcons.userPlus),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            // Body List

            ref.watch(cartProductProvider).items.isEmpty
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.empty.cartEmpty.image(),
                        Text("Belum ada produk ditambahkan"),
                        SizedBox(
                          height: AppSpacings.xl.sp,
                        ),
                        ButtonFixedText(
                          text: "Kembali",
                          size: Size(60.w, 45),
                          onPress: () {
                            context.router.pop();
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: primerTheme.canvas.inset,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              height: 1,
                            ),
                            itemCount: ref.watch(cartProductProvider).items.length,
                            itemBuilder: (context, index) {
                              var item = ref.watch(cartProductProvider).items[index];
                              return CartItemWidget(
                                itemModel: item,
                                onTap: () {
                                  context.router.pushNamed(PosRouteName.PosCartDetail.replaceFirst(RegExp(r":id"), index.toString()));
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      // Bottom Action
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: primerTheme.canvas.dflt,
                          border: Border(
                            top: BorderSide(
                              color: primerTheme.border.dflt,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                ResumeLabelValueWidget(label: "Subtotal", value: "Rp. 120.000"),
                                Spacing.height(
                                  size: 8,
                                ),
                                ResumeLabelValueWidget(label: "Diskon", value: "Rp. 20.000"),
                              ],
                            ),
                            Spacing.height(
                              size: 8,
                            ),
                            ResumeLabelValueWidget(
                              label: "Total",
                              value: "Rp. 100.000",
                              isBold: true,
                            ),
                            Spacing.height(
                              size: 20,
                            ),
                            ButtonFullText(
                              text: "Bayar",
                              onPress: () {
                                context.router.pushNamed(PosRouteName.PosPayment);
                              },
                              buttonType: ButtonType.Primary,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
