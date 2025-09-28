import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/comms/discovery_receiver.dart';

class DevicesSelector extends StatelessWidget {
  final List<DeviceInfo> devices;
  final bool             detailed;

  DevicesSelector({super.key, required this.devices, this.detailed = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, idx) {
        return _DeviceEntry(info: devices[idx], showDetails: detailed);
      }
    );
  }
}

class _DeviceEntry extends StatelessWidget {
  final DeviceInfo info;
  final bool       showDetails;

  _DeviceEntry({super.key, required this.info, this.showDetails=false});

  @override
  Widget build(BuildContext context) {
    var app_state = Provider.of<PiMoteAppState>(context);
    return Card(
      child: ListTile(
        leading: Radio<String>(
          value: info.name,
          groupValue: app_state.currentDevice,
          onChanged: (String? value) {
            app_state.currentDevice = value;
          }
        ),
        title: Text(info.name),
        subtitle: showDetails ?
          Text('${info.description}\nIP: ${info.ip_addr}') :
          null,
      ),
    );
  }
}
