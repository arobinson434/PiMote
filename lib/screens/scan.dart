import 'dart:async';
import 'package:flutter/material.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/views/devices_listview.dart';

Future<void> scanForDevices(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _DeviceScanner();
    }
  );
}

class _DeviceScanner extends StatelessWidget {
  const _DeviceScanner({super.key});

  @override
  void initState() {
    AndroidMulticastLock().acquire();
  }

  @override
  void dispose() {
    AndroidMulticastLock().release();
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

