import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:ala_pos/presentation/pages/receipt/cubit/preview/receipt_cubit.dart';
import 'package:ala_pos/presentation/pages/receipt/screen/scan_printer_screen.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

import '../../../../domain/models/transaction/transaction_model.dart';

class ReceiptScreen extends HookWidget {
  ReceiptScreen({Key? key, required this.transactionModel}) : super(key: key);

  final TransactionModel transactionModel;

  final GlobalKey genKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var receiptCubit = context.read<ReceiptCubit>();

    receiptCubit.build(transactionModel);

    return Scaffold(
      appBar: AppBar(
        title: Text("Struk"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ReceiptCubit, ReceiptState>(
                builder: (context, state) {
                  return state.when(
                    initial: () {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loaded: (transaction, store) {
                      return RepaintBoundary(
                        key: genKey,
                        child: Container(
                          // alignment: Alignment.center,
                          padding: EdgeInsets.only(left: AppSpacings.x4l, right: AppSpacings.x4l, top: 40.sp, bottom: 20.sp),
                          width: 90.w,
                          decoration: BoxDecoration(
                            boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 0.2, blurRadius: 0.1)],
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          child: Column(
                            children: [
                              Text(
                                store.name,
                                style: Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Theme.of(context).colorScheme.onBackground,
                                    ),
                              ),
                              Text(
                                store.address!,
                                style: Theme.of(context).textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: AppSpacings.x2l.sp),
                              SizedBox(
                                height: 50.sp,
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Tanggal",
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        DateFormat("dd-MM-y").format(transactionModel.date!),
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "No. Struk",
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        transactionModel.invoiceNumber!,
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                              Divider(),
                              // Row(
                              //   children: [
                              //     SizedBox(
                              //       width: 110.sp,
                              //       child: Text(
                              //         "Nama Item",
                              //         style: Theme.of(context).textTheme.titleSmall,
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 20.sp,
                              //       child: Text("Qty"),
                              //     ),
                              //     SizedBox(
                              //       width: 55.sp,
                              //       child: Text("Harga"),
                              //     ),
                              //     SizedBox(
                              //       child: Text("Total"),
                              //     ),
                              //   ],
                              // ),
                              // Divider(),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: transactionModel.items!.length,
                                  itemBuilder: (context, index) {
                                    var item = transactionModel.items![index];
                                    return Container(
                                      padding: EdgeInsets.only(bottom: AppSpacings.s.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 110.sp,
                                            child: Text(
                                              item.productName,
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                // width: 20.sp,
                                                child: Text(item.quantity.toString() + " X"),
                                              ),
                                              Expanded(
                                                // width: 55.sp,
                                                child: Text(item.result.toThousandSeparator(),
                                                    textAlign: TextAlign.right, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
                                              ),
                                              Expanded(
                                                // width: 55.sp,
                                                child: Text(item.amount.toThousandSeparator(),
                                                    textAlign: TextAlign.right, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              Divider(),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Subotal",
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                      Text(
                                        transactionModel.amount!.toThousandSeparator(),
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Diskon",
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                      Text(
                                        transactionModel.discountPrice!.toThousandSeparator(),
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        transactionModel.result.toThousandSeparator(),
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Divider(),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                "Terima kasih sudah berbelanja",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text("Made with Alapos")
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 100.w,
        height: 70.sp,
        padding: EdgeInsets.symmetric(vertical: AppSpacings.l.sp, horizontal: AppSpacings.m),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, boxShadow: [
          BoxShadow(color: Theme.of(context).shadowColor),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromWidth(30.w),
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              onPressed: () async {
                var path = await save(transactionModel.invoiceNumber!);

                var snackBar = SnackBar(
                  content: Text("Berhasil disimpan"),
                  action: SnackBarAction(
                    label: "Lihat",
                    onPressed: () {
                      OpenFile.open(path);
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Row(
                children: [
                  Icon(
                    Ionicons.save_outline,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: AppSpacings.s.sp,
                  ),
                  Text(
                    "Simpan",
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromWidth(30.w),
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              onPressed: () async {
                var path = await save(transactionModel.invoiceNumber!);
                Share.shareFiles([path], text: "Terima kasih sudah");
              },
              child: Row(
                children: [
                  Icon(
                    Ionicons.share_social,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: AppSpacings.s.sp,
                  ),
                  Text(
                    "Bagikan",
                  ),
                ],
              ),
            ),
            BlocBuilder<ReceiptCubit, ReceiptState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    minimumSize: Size.fromWidth(30.w),
                  ),
                  onPressed: () async {
                    if (await _requestPermission()) {
                      var store = state.maybeWhen(
                        loaded: (transactionModel, storeModel) => storeModel,
                        orElse: () => StoreModel(name: "Alapos"),
                      );

                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (_) {
                          return ScanPrinterScreen(transactionModel, store);
                        },
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Ionicons.receipt_outline,
                        size: 12.sp,
                      ),
                      SizedBox(
                        width: AppSpacings.s.sp,
                      ),
                      Text("Print"),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  save(String fileName) async {
    late String directory;
    RenderRepaintBoundary boundary = genKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    if (Platform.isAndroid) {
      directory = (await getExternalStorageDirectory())!.path;
    } else {
      directory = (await getApplicationDocumentsDirectory()).path;
    }
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile = await File('$directory/alapos/$fileName.png').create(recursive: true);
    imgFile.writeAsBytes(pngBytes);
    return imgFile.path;
  }

  Future<bool> _requestPermission() async {
    if (await Permission.bluetoothAdvertise.request().isGranted && await Permission.bluetoothConnect.request().isGranted && await Permission.bluetoothScan.request().isGranted) {
      return true;
    }
    return false;
  }
}
