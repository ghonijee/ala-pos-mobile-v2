import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'print_state.dart';
part 'print_cubit.freezed.dart';

FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

@injectable
class PrintCubit extends Cubit<PrintState> {
  PrintCubit() : super(PrintState.initial());

  init() {
    flutterBlue.startScan(timeout: Duration(seconds: 10));

    flutterBlue.scanResults.listen((results) {
      emit(PrintState.loaded(results));
    });
    flutterBlue.stopScan();
  }

  startScanDevices() {}

  stopScanDevices() {}
}
