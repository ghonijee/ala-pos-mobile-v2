import 'package:ala_pos/presentation/pages/setting/widget/bluetooth/bluetooth_state_nonactive.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class SettingPrintPage extends StatelessWidget {
  const SettingPrintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Printer"),
        centerTitle: false,
        actions: [
          StreamBuilder<bool>(
            stream: FlutterBluePlus.instance.isScanning,
            initialData: false,
            builder: (c, snapshot) {
              if (snapshot.data!) {
                return TextButton(
                  child: Text(
                    "Berhenti",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () => FlutterBluePlus.instance.stopScan(),
                );
              } else {
                return TextButton(
                    child: Text(
                      "Scan",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () => FlutterBluePlus.instance.startScan(timeout: const Duration(seconds: 10)));
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<BluetoothState>(
            stream: FlutterBluePlus.instance.state,
            initialData: BluetoothState.unknown,
            builder: (context, snapshot) {
              if (snapshot.data == BluetoothState.on) {
                return BluetoothStateActive();
              }
              return BluetoothStateNonactive();
            }),
      ),
    );
  }
}

class BluetoothStateActive extends StatelessWidget {
  const BluetoothStateActive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<List<BluetoothDevice>>(
              stream: Stream.periodic(const Duration(seconds: 2)).asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
              initialData: const [],
              builder: (c, snapshot) => Column(
                children: snapshot.data!
                    .map((d) => ListTile(
                          onTap: () {
                            context.router.pop();
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeviceScreen(device: d)));
                          },
                          title: Text(d.name),
                          subtitle: Text(
                            d.id.toString(),
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                          ),
                          trailing: Icon(
                            Ionicons.checkmark_done_circle,
                            color: Colors.green[400],
                          ),
                        ))
                    .toList(),
              ),
            ),
            StreamBuilder<List<ScanResult>>(
              stream: FlutterBluePlus.instance.scanResults,
              initialData: const [],
              builder: (c, snapshot) => Column(
                children: snapshot.data!
                    .map(
                      (result) => ListTile(
                        onTap: () async {
                          await result.device.disconnect();
                          await result.device.connect();
                        },
                        title: result.device.name.isEmpty ? Text(result.device.id.toString()) : Text(result.device.name),
                        subtitle: result.device.name.isEmpty
                            ? null
                            : Text(
                                result.device.id.toString(),
                                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: Theme.of(context).colorScheme.onSecondary,
                                    ),
                              ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Center(
              child: StreamBuilder<bool>(
                stream: FlutterBluePlus.instance.isScanning,
                initialData: false,
                builder: (c, snapshot) {
                  if (snapshot.data!) {
                    return CircularProgressIndicator();
                  }
                  return SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
