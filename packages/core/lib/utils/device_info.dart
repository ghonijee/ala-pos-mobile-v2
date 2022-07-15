import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

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
}// e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"