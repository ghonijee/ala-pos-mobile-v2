import 'dart:developer';

import 'package:ala_pos/feature/pos/domain/models/transaction/transaction_item_model.dart';
import 'package:ala_pos/feature/pos/provider/cart_product_provider.dart';
import 'package:ala_pos/feature/pos/routes/pos_router.dart';
import 'package:ala_pos/shared/styles/styles.dart';
import 'package:ala_pos/shared/utils/extension.dart';
import 'package:ala_pos/shared/widget/button/button_group_component.dart';
import 'package:ala_pos/shared/widget/form/text_area_form_component.dart';
import 'package:ala_pos/shared/widget/form/text_form_collapse_component.dart';
import 'package:ala_pos/shared/widget/form/text_form_component.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../shared/widget/button/button_full_component.dart';

class PosCartItemScreen extends HookConsumerWidget {
  const PosCartItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var primerTheme = PrimerTheme.of(context);

    final int index = int.parse(RouteData.of(context).pathParams.rawMap['id']);

    late TransactionItemModel itemModel;
    if (ref.watch(cartProductProvider).items.length > index) {
      itemModel = ref.watch(cartProductProvider).items[index];
    } else {
      return SizedBox();
    }
    var discountModeState = useState(itemModel.discountMode);

    // Set Form Data
    var productNameField = useTextEditingController(text: itemModel.productName);
    var productPriceField = useTextEditingController(text: itemModel.price.toCurrencyString(mantissaLength: 0, thousandSeparator: ThousandSeparator.Period));
    var productDiscountField =
        discountModeState.value == "harga" ? useTextEditingController(text: itemModel.discountPrice.toString()) : useTextEditingController(text: itemModel.discountPercentage.toString());
    var productNoteField = useTextEditingController(text: itemModel.note);
    var productQuantityField = useTextEditingController(text: itemModel.quantity.toString());

    log(itemModel.toJson().toString());

    return Scaffold(
      backgroundColor: primerTheme.canvas.dflt,
      body: SafeArea(
        bottom: false,
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
                    "Detail Produk",
                    style: primerTheme.typography.h4,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          // context.router.pop();
                          showDialog(
                            useRootNavigator: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Hapus Item",
                                  style: primerTheme.typography.h5,
                                ),
                                content: Container(
                                  child: Text(
                                    "Yakin menghapus produk ini dari keranjang?",
                                    style: primerTheme.typography.normal,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        context.router.pop();
                                      },
                                      child: Text(
                                        "Batal",
                                        style: primerTheme.typography.normal,
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        // context.router.canPop();
                                        Navigator.pop(context);
                                        context.router.pop();
                                        ref.read(cartProductProvider.notifier).deleteItem(index);
                                      },
                                      child: Text(
                                        "Hapus!",
                                        style: primerTheme.typography.normal,
                                      )),
                                ],
                              );
                            },
                          );
                          // context.router.pop();
                        },
                        child: Icon(FeatherIcons.trash, size: 20),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            // Body List
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppSpacings.l, vertical: AppSpacings.l),
                color: primerTheme.canvas.inset,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFieldComponent(
                        labelText: "Nama Produk",
                        controller: productNameField,
                      ),
                      Spacing.extraLarge(),
                      TextFieldComponent(
                        labelText: "Harga",
                        controller: productPriceField,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          // CurrencyInputFormatter(
                          //   thousandSeparator: ThousandSeparator.Period,
                          //   mantissaLength: 0,
                          // )
                        ],
                      ),
                      Spacing.extraLarge(),
                      ButtonGroupComponent(children: [
                        ButtonGroupItem<String>(
                          text: "Harga (Rp)",
                          value: "Harga",
                          isActive: discountModeState.value == "harga",
                          isFirst: true,
                          onTap: () {
                            discountModeState.value = "harga";
                          },
                        ),
                        ButtonGroupItem<String>(
                          text: "Persen (%)",
                          value: "Persen",
                          isActive: discountModeState.value == "persen",
                          isLast: true,
                          onTap: () {
                            discountModeState.value = "persen";
                          },
                        ),
                      ]),
                      Spacing.extraLarge(),
                      TextFieldCollapseComponent(
                        controller: productDiscountField,
                        hintText: "Nilai Diskon",
                        collapseMode: discountModeState.value == "harga" ? InputCollapseMode.Left : InputCollapseMode.Right,
                        prefix: Text(
                          "Rp.",
                          style: primerTheme.typography.bold,
                        ),
                        suffix: Text(
                          "%",
                          style: primerTheme.typography.bold,
                        ),
                      ),
                      Spacing.extraLarge(),
                      TextAreaComponent(
                        labelText: "Catatan",
                        controller: productNoteField,
                      ),
                      Spacing.extraLarge(),
                      TextFieldCollapseComponent(
                        controller: productQuantityField,
                        textAlign: TextAlign.center,
                        hintText: "Jumlah Produk",
                        collapseMode: InputCollapseMode.Both,
                        prefix: InkWell(
                            onTap: () {
                              var value = int.parse(productQuantityField.text) - 1;
                              if (value >= 0) {
                                productQuantityField.text = value.toString();
                              }
                            },
                            child: Icon(FeatherIcons.minus)),
                        suffix: InkWell(
                            onTap: () {
                              var value = int.parse(productQuantityField.text) + 1;
                              if (value >= 0) {
                                productQuantityField.text = value.toString();
                              }
                            },
                            child: Icon(FeatherIcons.plus)),
                      ),
                      Spacing.extraLarge(size: AppSpacings.x2l),
                      ButtonFullText(
                        text: "Simpan",
                        onPress: () {
                          itemModel.productName = productNameField.text;
                          itemModel.price = productPriceField.text.toNumber()!;
                          if (discountModeState.value == "harga") {
                            itemModel.discountPrice = productDiscountField.text.toNumber()!;
                          } else {
                            itemModel.discountPercentage = productDiscountField.text.toNumber()!.toDouble();
                          }
                          itemModel.discountMode = discountModeState.value;
                          itemModel.note = productNoteField.text;
                          itemModel.quantity = productQuantityField.text.toNumber()!;

                          ref.read(cartProductProvider.notifier).updateItem(itemModel, index);
                          context.router.pop();
                        },
                        buttonType: ButtonType.Primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom Action
          ],
        ),
      ),
    );
  }
}
