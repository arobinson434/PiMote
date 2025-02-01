import 'dart:async';
import 'package:flutter/material.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/views/emitters_listview.dart';

Future<void> scanForDevices(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return DeviceScanner(context: context);
    }
  );
}

class DeviceScanner extends StatefulWidget {
  final BuildContext context;
  const DeviceScanner({super.key, required BuildContext this.context});

  @override
  State<DeviceScanner> createState() => _DeviceScannerState();
}

class _DeviceScannerState extends State<DeviceScanner> {
  Timer? _t;
  int timeout = 5; // Will last 6 seconds as 0 is included;

  @override
  void initState() {
    super.initState();
    _t = Timer.periodic(Duration(seconds: 1), (timer) {
      if ( timeout < 1 ) {
        pop();
      } else {
        setState(() {
          timeout--;
        });
      }
    });

    AndroidMulticastLock().acquire();
  }

  @override
  void dispose() {
    AndroidMulticastLock().release();
    _t?.cancel();
    super.dispose();
  }

  void pop() { Navigator.of(widget.context).pop(); }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Scanning...'),
      content: Container(
        width: double.maxFinite,
        child: EmittersListView()
      ),
      actions: <Widget>[
        Text( 'Remaining: $timeout  '), 
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            pop();
          },
        ),
      ],
    );
  }
}

