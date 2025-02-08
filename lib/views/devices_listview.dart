import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/models/devices_model.dart';
import 'package:pi_mote/viewmodels/devices_viewmodel.dart';

class DevicesListView extends StatelessWidget {
  final bool detailed;
  DevicesListView({super.key, this.detailed = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<DevicesViewModel> (
      builder: (context, vmodel, child) {
        return ListView.builder(
          itemCount: vmodel.devices.length,
          itemBuilder: (context, idx) {
            final String key = vmodel.devices.keys.elementAt(idx);
            return DeviceView(
              name: key, data: vmodel.devices[key], showDetails: detailed
            );
          }
        );
      }
    );
  }
}

class DeviceView extends StatelessWidget {
  final String       name;
  final DeviceData? data;
  final bool         showDetails;

  DeviceView({super.key, required this.name, 
    required this.data, this.showDetails = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Radio<String>(
          value: name,
          groupValue: Provider.of<DevicesViewModel>(context,listen:false).currentDevice(),
          onChanged: (String? value) {
            Provider.of<DevicesViewModel>(context,listen:false).setCurrentDevice(value);
          }
        ),
        title: Text(name),
        subtitle: showDetails ?
          Text('${data?.description}\nIP: ${data?.ip_addr}') :
          null,
      ),
    );
  }
}
