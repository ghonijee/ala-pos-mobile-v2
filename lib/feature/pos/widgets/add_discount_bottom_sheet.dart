import 'package:ala_pos/shared/constants/button_enum.dart';
import 'package:ala_pos/shared/styles/styles.dart';
import 'package:ala_pos/shared/widget/button/button_fixed_component.dart';
import 'package:ala_pos/shared/widget/button/button_group_component.dart';
import 'package:ala_pos/shared/widget/form/text_form_collapse_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddDiscountBottomSheet extends HookConsumerWidget {
  const AddDiscountBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var discountModeState = useState("harga");
    PrimerThemeData primerTheme = PrimerTheme.of(context);
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      decoration: BoxDecoration(
        color: primerTheme.canvas.dflt,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 75,
            decoration: BoxDecoration(color: primerTheme.border.dflt, borderRadius: BorderRadius.circular(8)),
          ),
          Spacing.height(size: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Diskon Transaksi", style: primerTheme.typography.h4),
              Spacing.height(size: 24),
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
              Spacing.height(size: 24),
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
              Spacing.height(size: 100)
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonFixedText(
                  onPress: () {},
                  text: "Batal",
                  size: Size(42.w, 48),
                  buttonType: ButtonType.Secondary,
                ),
                ButtonFixedText(
                  onPress: () {},
                  text: "Simpan",
                  size: Size(42.w, 48),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
