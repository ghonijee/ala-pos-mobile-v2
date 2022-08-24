import 'dart:io';

import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:core/core.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../widget/bluetooth_inactive.dart';
import 'device_screen.dart';
import 'printer_widget.dart';
import 'receipt_screen.dart';

// import 'package:flutter_blue/flutter_blue.dart';

class ScanPrinterScreen extends StatelessWidget {
  final TransactionModel model;
  final StoreModel storeModel;

  ScanPrinterScreen(this.model, this.storeModel);

  void printReceipt(BluetoothDevice device) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    List<int> bytes = [];

    bytes += generator.text(storeModel.name,
        maxCharsPerLine: 15,
        styles: PosStyles(
          bold: true,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          align: PosAlign.center,
        ));
    bytes += generator.text(storeModel.address!,
        styles: PosStyles(
          align: PosAlign.center,
        ),
        linesAfter: 2);
    // bytes += generator.feed(2);

    if (model.customerName!.isNotEmpty) {
      bytes += generator.row([
        PosColumn(
          text: 'Nama Pembeli',
          width: 6,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: model.customerName!,
          width: 6,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
      bytes += generator.feed(1);
    }
    bytes += generator.row([
      PosColumn(
        text: 'No. Struk',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: model.invoiceNumber!,
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    bytes += generator.feed(1);
    bytes += generator.row([
      PosColumn(
        text: 'Tanggal',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: DateFormat("d-MM-y").format(model.date!),
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.hr();
    for (var item in model.items!) {
      bytes += generator.text(item.productName);
      bytes += generator.row([
        PosColumn(
          width: 6,
          text: item.quantity.toString() + " x " + item.result.toThousandSeparator(),
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          width: 6,
          text: item.amount.toThousandSeparator(),
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: 'Subtotal',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: model.amount!.toThousandSeparator(),
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: 'Diskon',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: model.discountPrice!.toThousandSeparator(),
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: 'Total',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: model.result.toThousandSeparator(),
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.hr();
    bytes += generator.feed(1);
    bytes += generator.text('Terimakasih', styles: const PosStyles(bold: true, align: PosAlign.center));
    bytes += generator.feed(1);
    bytes += generator.text('Made with Alapos', styles: const PosStyles(align: PosAlign.center));
    bytes += generator.cut();

    var printer = BluePrint();
    printer.setData(bytes);
    await printer.printData(device);
    // device.disconnect();
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 80.h,
      child: StreamBuilder<BluetoothState>(
          stream: FlutterBluePlus.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;

            if (state == BluetoothState.on) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          StreamBuilder<List<BluetoothDevice>>(
                            stream: Stream.periodic(const Duration(seconds: 2)).asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
                            initialData: const [],
                            builder: (c, snapshot) => Column(
                              children: snapshot.data!
                                  .map((d) => ListTile(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeviceScreen(device: d)));
                                        },
                                        title: Text(d.name),
                                        subtitle: Text(d.id.toString()),
                                        trailing: StreamBuilder<BluetoothDeviceState>(
                                          stream: d.state,
                                          initialData: BluetoothDeviceState.disconnected,
                                          builder: (c, snapshot) {
                                            if (snapshot.data == BluetoothDeviceState.connected) {
                                              return ElevatedButton(
                                                child: const Text('Print'),
                                                onPressed: () {
                                                  printReceipt(d);
                                                },
                                              );
                                            }
                                            return Text(snapshot.data.toString());
                                          },
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          StreamBuilder<List<ScanResult>>(
                            stream: FlutterBluePlus.instance.scanResults,
                            initialData: const [],
                            builder: (c, snapshot) => Column(
                              children: snapshot.data!
                                  .map(
                                    (r) => ScanResultTile(
                                      result: r,
                                      onTap: () async {
                                        await r.device.disconnect();
                                        await r.device.connect();
                                      },
                                      // onTap: () => Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       r.device.connect();
                                      //       return DeviceScreen(device: r.device);
                                      //     },
                                      //   ),
                                      // ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.sp,
                    child: StreamBuilder<bool>(
                      stream: FlutterBluePlus.instance.isScanning,
                      initialData: false,
                      builder: (c, snapshot) {
                        if (snapshot.data!) {
                          return ElevatedButton(
                            child: Text("Berhanti"),
                            style: ElevatedButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              minimumSize: Size.fromWidth(80.w),
                            ),
                            onPressed: () => FlutterBluePlus.instance.stopScan(),
                          );
                        } else {
                          return ElevatedButton(
                              child: Text("Scan Printer"),
                              style: ElevatedButton.styleFrom(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                minimumSize: Size.fromWidth(80.w),
                              ),
                              onPressed: () => FlutterBluePlus.instance.startScan(timeout: const Duration(seconds: 4)));
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  )
                ],
              );
            }
            return BluetoothStateNonactive();
          }),
    );
  }
}

class BluetoothStateNonactive extends StatelessWidget {
  const BluetoothStateNonactive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bluetooth_disabled,
                size: 15.h,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                'Bluetooth tidak aktif',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 35.sp,
          child: ElevatedButton(
            child: Text("Aktifkan Bluetooth"),
            style: ElevatedButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              minimumSize: Size.fromWidth(80.w),
            ),
            onPressed: Platform.isAndroid ? () => FlutterBluePlus.instance.turnOn() : null,
          ),
        ),
        SizedBox(
          height: 20.sp,
        )
      ],
    );
  }
}
