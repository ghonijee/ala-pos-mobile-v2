import 'package:ala_pos/feature/pos/routes/pos_router.dart';
import 'package:ala_pos/feature/pos/widgets/resume_label_value_widget.dart';
import 'package:ala_pos/gen/assets.gen.dart';
import 'package:ala_pos/routes/router.gr.dart';
import 'package:ala_pos/shared/styles/styles.dart';
import 'package:ala_pos/shared/widget/button/button_fixed_component.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PosResultSuccessScreen extends StatelessWidget {
  const PosResultSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var primerTheme = PrimerTheme.of(context);
    return Scaffold(
      backgroundColor: primerTheme.brand.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // height: 60.h,
                width: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(color: primerTheme.canvas.dflt, borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: [
                    Assets.images.done.svg(),
                    Spacing.large(),
                    Text(
                      "Pembayaran Berhasil",
                      style: primerTheme.typography.h3.copyWith(color: primerTheme.brand.primary),
                    ),
                    Spacing.large(),
                    SizedBox(
                      width: 178,
                      child: Text(
                        "Transaksi berhasil dibuat. Silakan cetak struk!",
                        style: primerTheme.typography.light,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacing.large(),
                    Divider(),
                    Spacing.large(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacings.xl),
                      child: Column(
                        children: [
                          ResumeLabelValueWidget(label: "Total", value: "Rp. 80.000"),
                          Spacing.large(),
                          ResumeLabelValueWidget(label: "Bayar", value: "Rp. 80.000"),
                          Spacing.large(),
                          ResumeLabelValueWidget(label: "Kembalian", value: "Rp. 0"),
                        ],
                      ),
                    ),
                    Spacing.extra2Large(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSpacings.s,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonFixedText(
                            onPress: () {},
                            text: "Cetak",
                            size: Size(38.w, 48),
                          ),
                          ButtonFixedText(
                            onPress: () {
                              context.router.navigateNamed(PosRouteName.Pos);
                            },
                            text: "Selesai",
                            size: Size(38.w, 48),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
