import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'print_state.dart';
part 'print_cubit.freezed.dart';

@injectable
class PrintCubit extends Cubit<PrintState> {
  // PrinterBluetoothManager printerBluetoothManager;
  PrintCubit() : super(PrintState.initial());
  // FlutterBlue flutterBlue = FlutterBlue.instance;

  init() {
    // Listen to scan results
    // flutterBlue.startScan(timeout: Duration(seconds: 4));

    // flutterBlue.scanResults.listen((results) {
    //   // do something with scan results
    //   for (ScanResult r in results) {
    //     print('${r.device.name} found! rssi: ${r.rssi}');
    //   }
    // });
    // flutterBlue.stopScan();

// Stop scanning
    // flutterBlue.stopScan();
  }

  startScanDevices() {}
  //   // emit new state
  //   printerBluetoothManager.startScan(Duration(seconds: 5));
  // }

  stopScanDevices() {}
  //   printerBluetoothManager.stopScan();
  // }
}
