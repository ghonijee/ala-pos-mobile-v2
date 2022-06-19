import 'package:ala_pos/presentation/pages/pos/widgets/product_container.dart';
import 'package:ala_pos/presentation/widgets/side_menu/widgets/side_menu_widget.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              context.push(RouteName.PosCart);
            },
            icon: Icon(Ionicons.cart_outline),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: [
            Container(
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
                        itemCount: 20,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: AppSpacings.s.sp,
                          mainAxisSpacing: AppSpacings.s.sp,
                        ),
                        itemBuilder: (context, index) {
                          return ProductContainer();
                        }),
                  ),
                  // Expanded(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(
                  //         Ionicons.cube_outline,
                  //         size: 40,
                  //       ),
                  //       SizedBox(
                  //         height: AppSpacings.m,
                  //       ),
                  //       Text(
                  //         "Silahkan\nScan / Cari Produk",
                  //         style: Theme.of(context).textTheme.bodyText2,
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                context.push(RouteName.PosCart);
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl),
                  width: 100.w,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total ", style: Theme.of(context).primaryTextTheme.titleMedium),
                      Text("15.000 (3 Item)", style: Theme.of(context).primaryTextTheme.titleMedium),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
