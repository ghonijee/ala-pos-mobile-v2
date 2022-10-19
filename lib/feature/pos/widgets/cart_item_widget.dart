import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:primer_flutter/primer_flutter.dart';

import '../../../shared/styles/styles.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({super.key});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    var primerTheme = PrimerTheme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: primerTheme.canvas.dflt,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: BoxConstraints.tight(Size(56, 56)),
              decoration: BoxDecoration(
                color: primerTheme.brand.quaternary,
              ),
              alignment: Alignment.center,
              child: Text(
                "2",
                style: primerTheme.typography.h4,
              ),
            ),
          ),
          Spacing.width(
            size: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Produk",
                  style: primerTheme.typography.h5,
                ),
                Spacing.height(
                  size: 4,
                ),
                true
                    ? Text.rich(
                        TextSpan(
                          text: "Rp. 10.000",
                          style: primerTheme.typography.normal.copyWith(decoration: TextDecoration.lineThrough),
                          children: [
                            TextSpan(
                              text: " " + "Rp. 5.000",
                              style: primerTheme.typography.normal.copyWith(
                                decoration: TextDecoration.none,
                              ),
                            )
                          ],
                        ),
                      )
                    : Text(
                        "Rp. 5.000",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                Spacing.height(
                  size: 4,
                ),
                Text("Gulanya sedikit saja"),
              ],
            ),
          ),
          Icon(FeatherIcons.chevronRight),
        ],
      ),
    );
  }
}
