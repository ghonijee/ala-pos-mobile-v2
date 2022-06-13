import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();

  void setValue(key, value) {
    storage.write(key: key, value: value);
  }

  Future getValue(key) {
    return storage.read(key: key);
  }

  getAll() {
    return storage.readAll();
  }

  void delete(key) {
    storage.delete(key: key);
  }

  clearAll() {
    storage.deleteAll();
  }
}
