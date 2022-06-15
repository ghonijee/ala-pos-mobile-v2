import 'package:ala_pos/domain/models/user_model.dart';
import 'package:ala_pos/presentation/pages/pos/widgets/product_container.dart';
import 'package:ala_pos/presentation/widgets/form_input/text_field_widget.dart';
import 'package:ala_pos/presentation/widgets/side_menu/widgets/side_menu_widget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class PosScreen extends HookWidget {
  const PosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuWidget(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Alapos"),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            // alignment: Alignment.center,
            margin: EdgeInsets.only(left: AppSpacings.m.sp, right: AppSpacings.m.sp),
            padding: EdgeInsets.all(AppSpacings.s.sp),
            width: 95.w,
            height: 100.h,
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                TextFormField(
                  // controller: controller,
                  style: Theme.of(context).textTheme.bodyText1,
                  // validator: validator,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(
                        Ionicons.search_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        print("search press");
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Ionicons.barcode_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        print("qrcode press");
                      },
                    ),
                    hintText: "Nama/Kode Barang",
                  ),
                ),
                SizedBox(
                  height: AppSpacings.m.sp,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: AppSpacings.s.sp,
                        mainAxisSpacing: AppSpacings.s.sp,
                      ),
                      itemBuilder: (context, index) {
                        return ProductContainer();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
