import 'package:ala_pos/feature/pos/provider/transaction_provider.dart';
import 'package:ala_pos/feature/pos/routes/pos_router.dart';
import 'package:ala_pos/feature/pos/widgets/cash_value_button.dart';
import 'package:ala_pos/feature/pos/widgets/payment_method_bottom_sheet.dart';
import 'package:ala_pos/shared/styles/styles.dart';
import 'package:ala_pos/shared/utils/extension.dart';
import 'package:ala_pos/shared/utils/snackbar_message.dart';
import 'package:ala_pos/shared/widget/button/button_full_component.dart';
import 'package:ala_pos/shared/widget/form/text_form_component.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PosPaymentScreen extends HookConsumerWidget {
  const PosPaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var primerTheme = PrimerTheme.of(context);
    var controller = ref.read(transactionProvider.notifier);
    var state = ref.watch(transactionProvider);

    var paymentReceiveField = useTextEditingController(text: state.model?.receivedMoney.toString());
    paymentReceiveField.addListener(
      () {
        var value = paymentReceiveField.text.toNumber();
        controller.setPayment(value!);
      },
    );

    return Scaffold(
      backgroundColor: primerTheme.canvas.dflt,
      body: SafeArea(
        // bottom: false,
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
                    "Pembayaran",
                    style: primerTheme.typography.h4,
                  ),
                ],
              ),
            ),
            // Body List
            Expanded(
              child: Container(
                color: primerTheme.canvas.inset,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: primerTheme.canvas.dflt,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Spacing.small(),
                              Container(
                                color: primerTheme.canvas.dflt,
                                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: primerTheme.typography.h4,
                                    ),
                                    Text(
                                      state.model?.result.toIDR() ?? "Rp. 0",
                                      style: primerTheme.typography.h4,
                                    ),
                                  ],
                                ),
                              ),
                              // Spacing.ex(),
                              Container(
                                color: primerTheme.canvas.dflt,
                                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                child: Column(
                                  children: [
                                    // Payment Method
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Metode Pembayaran",
                                          style: primerTheme.typography.normal,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                              ),
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return PaymentMethodBottomSheet();
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Cash",
                                                style: primerTheme.typography.h5,
                                              ),
                                              Spacing.small(),
                                              Icon(FeatherIcons.chevronRight),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacing.extra2Large(),
                                    Column(
                                      children: [
                                        Text(
                                          "Pembayaran diterima",
                                          style: primerTheme.typography.normal,
                                        ),
                                        Spacing.large(),
                                        TextFieldComponent(
                                          controller: paymentReceiveField,
                                          hintText: "100.000",
                                          textAlign: TextAlign.center,
                                          onChange: (value) {
                                            print(value);
                                          },
                                        ),
                                        Spacing.large(),
                                        RichText(
                                          text: TextSpan(text: "Kembalian: ", style: primerTheme.typography.normal, children: [
                                            TextSpan(
                                              text: state.model?.changeMoney?.toIDR() ?? "Rp. 0",
                                              style: primerTheme.typography.bold,
                                            )
                                          ]),
                                        )
                                      ],
                                    ),
                                    Spacing.extra2Large(),
                                    GridView(
                                      padding: EdgeInsets.zero,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: AppSpacings.l, mainAxisSpacing: AppSpacings.l, childAspectRatio: 4 / 2),
                                      children: [
                                        CashValueButton(
                                            label: "Rp. 200.000",
                                            onTap: () {
                                              paymentReceiveField.text = "200.000";
                                            }),
                                        CashValueButton(
                                            label: "Rp. 150.000",
                                            onTap: () {
                                              paymentReceiveField.text = "150.000";
                                            }),
                                        CashValueButton(
                                            label: "Rp. 100.000",
                                            onTap: () {
                                              paymentReceiveField.text = "100.000";
                                            }),
                                        CashValueButton(
                                            label: "Rp. 50.000",
                                            onTap: () {
                                              paymentReceiveField.text = "50.000";
                                            }),
                                        CashValueButton(
                                            label: "Rp. 20.000",
                                            onTap: () {
                                              paymentReceiveField.text = "20.000";
                                            }),
                                        CashValueButton(
                                            label: "Rp. 10.000",
                                            onTap: () {
                                              paymentReceiveField.text = "10.000";
                                            }),
                                        CashValueButton(
                                            label: "Rp. 5.000",
                                            onTap: () {
                                              paymentReceiveField.text = "5.000";
                                            }),
                                        CashValueButton(
                                            label: "Rp. 2.000",
                                            onTap: () {
                                              paymentReceiveField.text = "2.000";
                                            }),
                                        CashValueButton(
                                            label: "Rp. 1.000",
                                            onTap: () {
                                              paymentReceiveField.text = "1.000";
                                            }),
                                      ],
                                    ),
                                    Spacing.large(),
                                    ButtonFullText(
                                      elevation: 0,
                                      text: state.model?.result.toIDR() ?? "Rp. 0",
                                      onPress: () {
                                        paymentReceiveField.text = state.model?.result.toThousandSeparator() ?? "0";
                                      },
                                      buttonType: ButtonType.Secondary,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacing.small(),
                    Container(
                      color: primerTheme.canvas.dflt,
                      padding: EdgeInsets.fromLTRB(AppSpacings.l, AppSpacings.l, AppSpacings.l, AppSpacings.l),
                      child: ButtonFullText(
                        text: "Bayar",
                        onPress: () {
                          var check = controller.paymentValid();
                          if (!check) {
                            SnackbarMessage.failed(context, "Pembayaran masih kurang!");
                          } else {}
                          // context.router.pushNamed(PosRouteName.PosResultSuccess);
                        },
                        buttonType: ButtonType.Primary,
                      ),
                    ),
                  ],
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
