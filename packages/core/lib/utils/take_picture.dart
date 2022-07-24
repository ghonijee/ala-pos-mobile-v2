// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';

// class TakePicture {
//   static local(RenderRepaintBoundary boundary) async {
//     // RenderRepaintBoundary boundary = genKey.currentContext.findRenderObject();
//     ui.Image image = await boundary.toImage();
//     final directory = (await getApplicationDocumentsDirectory()).path;
//     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List pngBytes = byteData.buffer.asUint8List();
//     File imgFile = new File('$directory/photo.png');
//     imgFile.writeAsBytes(pngBytes);
//     print(imgFile.path);
//     return imgFile.path;
//   }
// }
