import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<AndroidDeviceInfo> get android => deviceInfo.androidInfo;
  Future<IosDeviceInfo> get ios => deviceInfo.iosInfo;
  Future<BaseDeviceInfo> get info {
    if (Platform.isIOS) {
      return deviceInfo.iosInfo;
    } else if (Platform.isAndroid) {
      return deviceInfo.androidInfo;
    }
    return deviceInfo.deviceInfo;
  }
}// e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"