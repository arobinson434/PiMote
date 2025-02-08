import 'dart:async';
import 'package:flutter/material.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/views/devices_listview.dart';

Future<void> scanForDevices(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _DeviceScanner(context: context);
    }
  );
}

class _DeviceScanner extends StatefulWidget {
  final BuildContext context;
  const _DeviceScanner({super.key, required BuildContext this.context});

  @override
  State<_DeviceScanner> createState() => _DeviceScannerState();
}

class _DeviceScannerState extends State<_DeviceScanner> {
  @override
  void initState() {
    super.initState();
    AndroidMulticastLock().acquire();
  }

  @override
  void dispose() {
    AndroidMulticastLock().release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Scanning...'),
      content: Container(
        width: double.maxFinite,
        child: DevicesListView(detailed: true)
      ),
      actions: <Widget>[
        TextButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

