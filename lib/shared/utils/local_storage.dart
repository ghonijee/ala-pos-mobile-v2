import 'dart:developer';

import 'package:ala_pos/shared/utils/platform_type.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/store_key.dart';

final localStorageProvider = Provider(
  (ref) => LocalStorage(ref.read(platformTypeProvider)),
);

class LocalStorage {
  final PlatformType _platform;
  LocalStorage(this._platform);
  void store(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    if (_platform == PlatformType.iOS || _platform == PlatformType.android || _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.write(key: key, value: value);
      } on Exception catch (e) {
        rethrow;
      }
    } else {
      await prefs.setString(key, value);
    }
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (_platform == PlatformType.iOS || _platform == PlatformType.android || _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.delete(key: key);
      } on Exception catch (e) {
        rethrow;
      }
    } else {
      await prefs.remove(key);
    }

    await prefs.remove(key);
  }

  Future<String?> read(key, {ifNull}) async {
    String? data;
    try {
      if (_platform == PlatformType.iOS || _platform == PlatformType.android || _platform == PlatformType.linux) {
        const storage = FlutterSecureStorage();
        data = await storage.read(key: key);
      } else {
        final prefs = await SharedPreferences.getInstance();
        data = prefs.getString(key);
      }
      return data;
    } on Exception catch (e) {
      log("Read local store faield: ${e.toString()}");
      return null;
    }
  }
}
