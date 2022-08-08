import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:sizer/sizer.dart';

class BluetoothInactiveWidget extends StatelessWidget {
  const BluetoothInactiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bluetooth_disabled,
                size: 15.h,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                'Bluetooth tidak aktif',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 35.sp,
          child: ElevatedButton(
            child: Text("Aktifkan Bluetooth"),
            style: ElevatedButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              minimumSize: Size.fromWidth(80.w),
            ),
            onPressed: Platform.isAndroid ? () => FlutterBluePlus.instance.turnOn() : null,
          ),
        ),
        SizedBox(
          height: 20.sp,
        )
      ],
    );
  }
}
