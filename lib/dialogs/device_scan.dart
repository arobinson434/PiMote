import 'dart:async';
import 'package:flutter/material.dart';

import 'package:pi_mote/comms/discovery_receiver.dart';
import 'package:pi_mote/components/device_selector.dart';

Future<void> scanForDevices(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _DeviceScanner();
    }
  );
}

class _DeviceScanner extends StatefulWidget {
  const _DeviceScanner({super.key});

  @override
  State<_DeviceScanner> createState() => _DeviceScannerState();
}

class _DeviceScannerState extends State<_DeviceScanner> {
  final Set<DeviceInfo>   _devices  = Set<DeviceInfo>();
  final DiscoveryReceiver _receiver = DiscoveryReceiver();

  @override
  void initState() {
    super.initState();
    _receiver.init();
    _receiver.getEventStream().listen(processDiscovery);
  }

  @override
  void dispose() {
    _receiver.dispose();
    super.dispose();
  }

  void processDiscovery(DeviceInfo di) {
    if ( !_devices.contains(di) )
      setState( () { _devices.add(di); } );
  }

  @override
  Widget build(BuildContext context) {
    var device_list = _devices.toList();
    device_list.sort( (a,b) => a.name.compareTo(b.name));

    return AlertDialog(
      title: const Text('Scanning...'),
      content: Container(
        width: double.maxFinite,
        child: DevicesSelector(devices: device_list, detailed: true)
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

