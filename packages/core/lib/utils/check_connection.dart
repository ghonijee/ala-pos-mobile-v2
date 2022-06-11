import 'dart:io';

class CheckConnection {
  static Future<bool> internetCheck() async {
    try {
      var result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        throw const SocketException("No Internet");
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
