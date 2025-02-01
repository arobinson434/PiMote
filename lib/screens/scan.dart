import 'dart:async';
import 'package:flutter/material.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/views/emitters_listview.dart';

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
  Timer? _timer;
  int _timeout = 5; // Will last 6 seconds as 0 is included;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if ( _timeout < 1 ) {
        pop();
      } else {
        setState(() {
          _timeout--;
        });
      }
    });

    AndroidMulticastLock().acquire();
  }

  @override
  void dispose() {
    AndroidMulticastLock().release();
    _timer?.cancel();
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
        Text( 'Remaining: $_timeout  '), 
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

