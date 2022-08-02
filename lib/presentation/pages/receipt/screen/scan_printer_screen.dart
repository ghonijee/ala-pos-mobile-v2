import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';

// import 'package:flutter_blue/flutter_blue.dart';

FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

class ScanPrinterScreen extends StatefulWidget {
  const ScanPrinterScreen({Key? key}) : super(key: key);

  @override
  State<ScanPrinterScreen> createState() => _ScanPrinterScreenState();
}

class _ScanPrinterScreenState extends State<ScanPrinterScreen> {
  List<ScanResult>? scanResult = [];

  @override
  void initState() {
    super.initState();
    findDevices();
  }

  void findDevices() {
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    flutterBlue.scanResults.listen((results) {
      setState(() {
        scanResult = results;
      });
    });
    flutterBlue.stopScan();
  }

  void printWithDevice(BluetoothDevice device) async {
    await device.connect();

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);
    List<int> bytes = [];

    bytes += generator.text('Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
    bytes += generator.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ', styles: const PosStyles(codeTable: 'CP1252'));
    bytes += generator.text('Special 2: blåbærgrød', styles: const PosStyles(codeTable: 'CP1252'));

    bytes += generator.text('Bold text', styles: const PosStyles(bold: true));
    bytes += generator.text('Reverse text', styles: const PosStyles(reverse: true));
    bytes += generator.text('Underlined text', styles: const PosStyles(underline: true), linesAfter: 1);
    bytes += generator.text('Align left', styles: const PosStyles(align: PosAlign.left));
    bytes += generator.text('Align center', styles: const PosStyles(align: PosAlign.center));
    bytes += generator.text('Align right', styles: const PosStyles(align: PosAlign.right), linesAfter: 1);

    bytes += generator.row([
      PosColumn(
        text: 'col3',
        width: 3,
        styles: const PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col6',
        width: 6,
        styles: const PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col3',
        width: 3,
        styles: const PosStyles(align: PosAlign.center, underline: true),
      ),
    ]);

    bytes += generator.text('Text size 200%',
        styles: const PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    // Print barcode
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));

    bytes += generator.feed(2);
    bytes += generator.cut();
    var printer = BluePrint();
    printer.add(bytes);
    printer.printData(device);
    device.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 100.w,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Expanded(
            child: scanResult != null
                ? ListView.builder(
                    itemCount: scanResult!.length,
                    itemBuilder: (context, index) {
                      var data = scanResult![index];
                      return ListTile(
                        title: Text(data.device.name),
                        onTap: () {
                          printWithDevice(scanResult![index].device);
                        },
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          )
        ],
      ),
    );
  }
}

class BluePrint {
  BluePrint({this.chunkLen = 512});

  final int chunkLen;
  final _data = List<int>.empty(growable: true);

  void add(List<int> data) {
    _data.addAll(data);
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
    for (var i = 0; i < characs.length; i++) {
      if (await _tryPrint(characs[i], data)) {
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
    for (var i = 0; i < services.length; i++) {
      res.addAll(services[i].characteristics);
    }
    return res;
  }
}
