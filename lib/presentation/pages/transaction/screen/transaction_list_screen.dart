import 'package:core/styles/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/side_menu/widgets/side_menu_widget.dart';

class TransactionListScreen extends StatelessWidget {
  const TransactionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuWidget(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Transaksi"),
        actions: [],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          width: 100.w,
          height: 85.h,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacings.m.sp,
            vertical: AppSpacings.m.sp,
          ),
          child: Column(
            children: [
              TextFormField(
                // controller: searchController,
                style: Theme.of(context).textTheme.bodyText1,
                onEditingComplete: () {},
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      Ionicons.search_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      //
                    },
                  ),
                  hintText: "Nomer Transaksi",
                ),
              ),
              SizedBox(
                height: AppSpacings.m.sp,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: AppSpacings.s.sp),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hari ini, 21 Juni 2022",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Rp. 50.000",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          addAutomaticKeepAlives: true,
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: AppSpacings.s.sp,
                            );
                          },
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                constraints: BoxConstraints(minHeight: 32.sp, minWidth: 32.sp),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.all(Radius.circular(8))),
                                child: Icon(
                                  Ionicons.cash_outline,
                                  size: AppSpacings.xl,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              title: Text("Rp. 25.000"),
                              subtitle: Text("2 items"),
                              trailing: Text("09:30"),
                            );
                          },
                        )
                      ]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
