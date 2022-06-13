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

  clearAll(key) async {
    var storage = await Hive.openBox(key);

    storage.clear();
  }
}
