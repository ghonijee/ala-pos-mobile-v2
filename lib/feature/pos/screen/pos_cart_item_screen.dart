import 'package:ala_pos/shared/styles/styles.dart';
import 'package:ala_pos/shared/widget/button/button_group_component.dart';
import 'package:ala_pos/shared/widget/form/text_area_form_component.dart';
import 'package:ala_pos/shared/widget/form/text_form_collapse_component.dart';
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

import '../../../shared/widget/button/button_full_component.dart';

class PosCartItemScreen extends HookConsumerWidget {
  // final int bookId;
  const PosCartItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var primerTheme = PrimerTheme.of(context);
    var discountModeState = useState("harga");

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
                        },
                        child: Icon(FeatherIcons.trash),
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
                      ),
                      Spacing.extraLarge(),
                      TextFieldComponent(
                        labelText: "Harga",
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
                      ),
                      Spacing.extraLarge(),
                      TextFieldCollapseComponent(
                        textAlign: TextAlign.center,
                        hintText: "Nilai Diskon",
                        collapseMode: InputCollapseMode.Both,
                        prefix: Icon(FeatherIcons.minus),
                        suffix: Icon(FeatherIcons.plus),
                      ),
                      Spacing.extraLarge(size: AppSpacings.x2l),
                      ButtonFullText(
                        text: "Simpan",
                        onPress: () {
                          //
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
