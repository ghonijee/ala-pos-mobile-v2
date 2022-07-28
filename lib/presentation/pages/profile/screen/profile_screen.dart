import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Ionicons.arrow_back_outline,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            context.router.pop();
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: AppSpacings.l.sp,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSpacings.l.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 60.sp,
                  height: 60.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  child: Text(
                    "Ahmad Yunus Afghoni".initial(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  width: AppSpacings.l.sp,
                ),
                SizedBox(
                  // height: 60.sp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahmad Yunus Afghoni",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: AppSpacings.xs.sp,
                      ),
                      Text("081510897752", style: Theme.of(context).textTheme.bodyText2),
                      SizedBox(
                        height: AppSpacings.xs.sp,
                      ),
                      Text("akughoni@gmail.com", style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40.sp,
          ),
          SizedBox(
            height: 20.sp,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: 50.sp,
                // height: 50.sp,
                child: Icon(Ionicons.person_outline),
              ),
              Expanded(child: Text("Ubah Profile User", style: Theme.of(context).textTheme.bodyText1)),
              SizedBox(
                width: 50.sp,
                // height: 50.sp,
                child: Icon(Ionicons.arrow_forward),
              ),
            ]),
          ),
          Divider(
            color: Colors.grey[400],
            height: AppSpacings.x4l.sp,
            indent: 10.sp,
            endIndent: 10.sp,
          ),
          SizedBox(
            height: 20.sp,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: 50.sp,
                // height: 50.sp,
                child: Icon(Ionicons.lock_closed_outline),
              ),
              Expanded(child: Text("Ubah Password", style: Theme.of(context).textTheme.bodyText1)),
              SizedBox(
                width: 50.sp,
                // height: 50.sp,
                child: Icon(Ionicons.arrow_forward),
              ),
            ]),
          ),
          Divider(
            color: Colors.grey[400],
            height: AppSpacings.x4l.sp,
            indent: 10.sp,
            endIndent: 10.sp,
          ),
          SizedBox(
            height: 30.sp,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: 50.sp,
                // height: 50.sp,
                child: Icon(Ionicons.storefront_outline),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ganti Toko", style: Theme.of(context).textTheme.bodyText1),
                  Text("Surya Kencana ", style: Theme.of(context).textTheme.bodyText2),
                ],
              )),
              SizedBox(
                width: 50.sp,
                // height: 50.sp,
                child: Icon(Ionicons.arrow_forward),
              ),
            ]),
          ),
          Divider(
            color: Colors.grey[400],
            height: AppSpacings.x4l.sp,
            indent: 10.sp,
            endIndent: 10.sp,
          ),
        ],
      )),
    );
  }
}
