import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../widget/setting_menu_item_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

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
        // backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Pengaturan",
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingMenuItemWidget(
              icon: Icon(Ionicons.print_outline),
              title: "Printer",
              onTap: () {
                context.router.pushNamed(RouteName.settingPrinter);
              },
              hasTrailIcon: false,
            ),
            Divider(
              color: Colors.grey[400],
              height: AppSpacings.x2l.sp,
              indent: 10.sp,
              endIndent: 10.sp,
            ),
          ],
        ),
      ),
    );
  }
}
