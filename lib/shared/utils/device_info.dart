import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deviceInfoProvider = Provider<DeviceInfo>((ref) => DeviceInfo());

class DeviceInfo {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<AndroidDeviceInfo> get android => deviceInfo.androidInfo;
  Future<IosDeviceInfo> get ios => deviceInfo.iosInfo;
  Future<dynamic> get info {
    if (Platform.isIOS) {
      return deviceInfo.iosInfo;
    } else if (Platform.isAndroid) {
      return deviceInfo.androidInfo;
    }
    return deviceInfo.deviceInfo;
  }

  Future<String> get deviceName {
    if (Platform.isIOS) {
      return deviceInfo.iosInfo.then((value) => value.model!);
    } else if (Platform.isAndroid) {
      return deviceInfo.androidInfo.then((value) => value.brand ?? "Android");
    }
    return deviceInfo.deviceInfo.then((value) => "default");
  }
}
