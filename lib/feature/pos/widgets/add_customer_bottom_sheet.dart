import 'package:ala_pos/feature/pos/provider/transaction_provider.dart';
import 'package:ala_pos/shared/constants/button_enum.dart';
import 'package:ala_pos/shared/styles/styles.dart';
import 'package:ala_pos/shared/widget/button/button_fixed_component.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../shared/widget/form/text_form_component.dart';

class AddCustomerBottomSheet extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PrimerThemeData primerTheme = PrimerTheme.of(context);
    var controller = ref.read(transactionProvider.notifier);
    var state = ref.watch(transactionProvider);

    var customerNameField = useTextEditingController(text: state.model?.customerName);

    return SingleChildScrollView(
      child: Container(
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
                Text("Data Pelanggan", style: primerTheme.typography.h4),
                Spacing.height(size: 24),
                TextFieldComponent(
                  controller: customerNameField,
                  hintText: "Nama Pelanggan",
                ),
                Spacing.height(size: 100)
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonFixedText(
                    onPress: () {
                      context.router.pop();
                    },
                    text: "Batal",
                    size: Size(42.w, 48),
                    buttonType: ButtonType.Secondary,
                  ),
                  ButtonFixedText(
                    onPress: () {
                      var name = customerNameField.text.isEmpty ? null : customerNameField.text;
                      controller.changeNameCustomer(name);
                      context.router.pop();
                    },
                    text: "Simpan",
                    size: Size(42.w, 48),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
