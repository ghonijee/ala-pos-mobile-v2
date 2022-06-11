import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SaveToLocalFile {
  static json(json, {filename = "order"}) async {
    var downloadPath;
    if (Platform.isAndroid) {
      downloadPath = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      downloadPath = await getDownloadsDirectory();
    }
    File jsonPath = File(downloadPath!.path + "/$filename.json");
    jsonPath.writeAsString(jsonEncode(json));
  }

  static plainText(json, {filename = "order"}) async {
    var downloadPath;
    if (Platform.isAndroid) {
      downloadPath = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      downloadPath = await getDownloadsDirectory();
    }
    File filePath = File(downloadPath!.path + "/$filename.txt");
    filePath.writeAsString(jsonEncode(json));
  }
}
