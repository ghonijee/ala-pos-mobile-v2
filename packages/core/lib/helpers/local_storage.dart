import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class LocalStorage {
  // final storage = const FlutterSecureStorage();

  void setValue(key, value) async {
    var storage = await Hive.openBox(key);

    await storage.put(key, value);
  }

  Future getValue(key) async {
    var storage = await Hive.openBox(key);

    return storage.get(key);
  }

  Future<Map<String, dynamic>> getValueJson(key) async {
    Box box = await Hive.openBox(key);
    var value = box.get(key);
    if (value.isNotEmpty) {
      Map<String, dynamic> jsonData = Map<String, dynamic>.from(value);
      // final Map<String, dynamic> jsonData = await jsonDecode(value);
      return jsonData;
    }
    return <String, dynamic>{};
  }

  clearAll(key) async {
    var storage = await Hive.openBox(key);

    storage.clear();
  }
}
