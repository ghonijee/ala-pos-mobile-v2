import 'package:ala_pos/feature/product/domain/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ala_pos/shared/utils/extension.dart';

class ProductItemGridComponent extends StatefulWidget {
  const ProductItemGridComponent({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductItemGridComponent> createState() => _ProductItemGridComponentState();
}

class _ProductItemGridComponentState extends State<ProductItemGridComponent> {
  @override
  Widget build(BuildContext context) {
    var primeTheme = PrimerTheme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 40.w,
        height: 175.px,
        decoration: BoxDecoration(
          color: primeTheme.canvas.dflt,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              child: Image.network(
                "https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text("No Image"),
                  );
                },
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel.name,
                      style: primeTheme.typography.small,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Divider(),
                        Text(
                          widget.productModel.price.toIDR(),
                          style: primeTheme.typography.smallBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
