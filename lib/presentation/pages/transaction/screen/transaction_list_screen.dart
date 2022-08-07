import 'package:ala_pos/domain/models/transaction/transaction_group_model.dart';
import 'package:ala_pos/presentation/pages/transaction/cubit/transaction_list/transaction_list_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/side_menu/widgets/side_menu_widget.dart';
import '../cubit/transaction_detail/transaction_detail_cubit.dart';

class TransactionListScreen extends HookWidget {
  const TransactionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final scrollController = useScrollController();

    var listCubit = context.read<TransactionListCubit>();
    var detailCubit = context.read<TransactionDetailCubit>();

    listCubit.getTransactionList(initialData: true);

    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
        listCubit.getTransactionList(nextPage: true, initialData: false);
      }
    });

    return BlocConsumer<TransactionListCubit, TransactionListState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          drawer: SideMenuWidget(),
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text(
              "Riwayat Transaksi",
              // style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface),
            ),
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
                    controller: searchController,
                    style: Theme.of(context).textTheme.bodyText1,
                    onEditingComplete: () {
                      if (searchController.text.isNotEmpty) {
                        listCubit.getTransactionList(value: searchController.text, initialData: true);
                      } else {
                        listCubit.getTransactionList(value: '', initialData: true);
                      }
                    },
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
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Ionicons.close_outline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () async {
                                listCubit.getTransactionList(value: '', initialData: true);
                              },
                            )
                          : null,
                      hintText: "Nomor Transaksi",
                    ),
                  ),
                  SizedBox(
                    height: AppSpacings.m.sp,
                  ),
                  state.maybeWhen(loading: () {
                    return Expanded(
                        child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ));
                  }, loaded: (list, nextPage) {
                    var listGroupTransaction = TransactionGroupModel.fromTransactionList(list);

                    return Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: nextPage ? listGroupTransaction.length + 1 : listGroupTransaction.length,
                        itemBuilder: (context, index) {
                          DateFormat dateFormat = DateFormat("EEEE, dd-MM-y", "id");
                          TransactionGroupModel group;
                          if (index < listGroupTransaction.length) {
                            group = listGroupTransaction[index];
                          } else {
                            group = TransactionGroupModel();
                          }
                          return index >= listGroupTransaction.length
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(vertical: AppSpacings.s.sp),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dateFormat.format(group.date!),
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          group.amount!.toIDR(),
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: group.items!.length,
                                      addAutomaticKeepAlives: true,
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                          height: AppSpacings.s.sp,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        var item = group.items![index];
                                        return ListTile(
                                          onTap: () {
                                            detailCubit.load(group.items![index]);
                                            AutoRouter.of(context).pushNamed(RouteName.transactionDetail);
                                          },
                                          contentPadding: EdgeInsets.zero,
                                          leading: Container(
                                            constraints: BoxConstraints(minHeight: 32.sp, minWidth: 32.sp),
                                            decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.1), borderRadius: BorderRadius.all(Radius.circular(8))),
                                            child: Icon(
                                              Ionicons.cash_outline,
                                              size: AppSpacings.xl,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          ),
                                          title: Text(item.invoiceNumber ?? "-"),
                                          subtitle: Text(item.items!.length.toString() + " Item"),
                                          trailing: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(item.amount!.toIDR()),
                                              // SizedBox(
                                              //   height: 4.sp,
                                              // ),
                                              // Text(item.items!.length.toString() + " item"),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  ]),
                                );
                        },
                      ),
                    );
                  }, orElse: () {
                    return SizedBox();
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
