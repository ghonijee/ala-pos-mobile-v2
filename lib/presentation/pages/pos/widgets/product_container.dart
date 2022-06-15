import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102.sp,
      height: 90.sp,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
    );
  }
}
