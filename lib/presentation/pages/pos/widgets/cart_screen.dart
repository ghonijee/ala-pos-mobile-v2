import 'package:ala_pos/routes/route_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
      ),
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        child: Column(
          children: [
            Expanded(
              // height: 50.h,
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        height: 0,
                        thickness: 0.2,
                      ),
                  shrinkWrap: false,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        context.push(RouteName.PosOrderItemEdit);
                      },
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSpacings.m.sp,
                      ),
                      title: Text("Pensil $index"),
                      subtitle: Text(
                        "5.000",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      trailing: SizedBox(
                        width: 20.w,
                        height: 10.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Ionicons.add_circle_outline),
                            Text("1"),
                            Icon(Ionicons.remove_circle_outline),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Divider(
              height: AppSpacings.m,
              thickness: 0.8,
            ),
            Container(
              height: 15.h,
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacings.m.sp,
                vertical: AppSpacings.m.sp,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "40.000",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSpacings.m,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40.sp),
                    ),
                    onPressed: () {
                      context.push(RouteName.PosOrderResume);
                    },
                    child: Text(
                      "Checkout",
                      style: Theme.of(context).primaryTextTheme.button,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
