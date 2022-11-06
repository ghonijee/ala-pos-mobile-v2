import 'package:ala_pos/shared/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:primer_flutter/primer_flutter.dart';

import '../../../shared/styles/styles.dart';
import '../domain/models/transaction/transaction_item_model.dart';

class CartItemWidget extends StatefulWidget {
  CartItemWidget({super.key, required this.onTap, required this.itemModel});
  final TransactionItemModel itemModel;

  /// For naviation to detail cart item
  final Function() onTap;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    var primerTheme = PrimerTheme.of(context);

    return InkWell(
      onTap: widget.onTap,
      child: Container(
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
                  widget.itemModel.quantity.toString(),
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
                    widget.itemModel.productName,
                    style: primerTheme.typography.h5,
                  ),
                  Spacing.height(
                    size: 4,
                  ),
                  widget.itemModel.discountPercentage! > 0 || widget.itemModel.discountPrice > 0
                      ? Text.rich(
                          TextSpan(
                            text: widget.itemModel.price.toIDR(),
                            style: primerTheme.typography.normal.copyWith(decoration: TextDecoration.lineThrough),
                            children: [
                              TextSpan(
                                text: " " + widget.itemModel.result.toIDR(),
                                style: primerTheme.typography.normal.copyWith(
                                  decoration: TextDecoration.none,
                                ),
                              )
                            ],
                          ),
                        )
                      : Text(
                          widget.itemModel.price.toIDR(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                  widget.itemModel.note?.isNotEmpty ?? false
                      ? Column(
                          children: [
                            Spacing.height(
                              size: 4,
                            ),
                            Text(widget.itemModel.note ?? ""),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Icon(FeatherIcons.chevronRight),
          ],
        ),
      ),
    );
  }
}
