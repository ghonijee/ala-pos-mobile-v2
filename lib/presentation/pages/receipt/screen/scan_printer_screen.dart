import 'dart:io';

import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:core/core.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../widget/bluetooth_inactive.dart';
import 'device_screen.dart';
import 'printer_widget.dart';

// import 'package:flutter_blue/flutter_blue.dart';

class ScanPrinterScreen extends StatelessWidget {
  final TransactionModel model;
  final StoreModel storeModel;

  ScanPrinterScreen(this.model, this.storeModel);

  void printReceipt(BluetoothDevice device) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    List<int> bytes = [];

    bytes += generator.text(storeModel.name + " Meredea Raya",
        maxCharsPerLine: 15,
        styles: PosStyles(
          bold: true,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
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
            return BluetoothInactiveWidget();
          }),
    );
  }
}

class BluePrint {
  BluePrint({this.chunkLen = 512});

  final int chunkLen;
  var _data = List<int>.empty();

  void add(List<int> data) {
    _data.addAll(data);
  }

  void setData(List<int> data) {
    _data = data;
  }

  List<List<int>> getChunks() {
    final chunks = List<List<int>>.empty(growable: true);
    for (var i = 0; i < _data.length; i += chunkLen) {
      chunks.add(_data.sublist(i, min(i + chunkLen, _data.length)));
    }
    return chunks;
  }

  Future<void> printData(BluetoothDevice device) async {
    final data = getChunks();
    final characs = await _getCharacteristics(device);
    for (var charac in characs) {
      if (await _tryPrint(charac, data)) {
        break;
      }
    }
  }

  Future<bool> _tryPrint(
    BluetoothCharacteristic charac,
    List<List<int>> data,
  ) async {
    for (var i = 0; i < data.length; i++) {
      try {
        await charac.write(data[i]);
      } catch (e) {
        return false;
      }
    }

    return true;
  }

  Future<List<BluetoothCharacteristic>> _getCharacteristics(
    BluetoothDevice device,
  ) async {
    final services = await device.discoverServices();
    final res = List<BluetoothCharacteristic>.empty(growable: true);
    for (var service in services) {
      res.addAll(service.characteristics);
    }

    return res;
  }
}
