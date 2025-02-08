import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/components/remote_button.dart';
import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';
import 'package:pi_mote/viewmodels/devices_viewmodel.dart';

class RemotePane extends StatelessWidget {
  final List<RemoteButton> children;

  RemotePane({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: children, // <-- Parent's buttons
              )
            )
          ),
          Text(
            Provider.of<CmdMgrViewModel>(context).learningEnabled ?
              "Edit Mode Active" : "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "Device: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextSpan(
                text: Provider.of<DevicesViewModel>(context).currentDevice() ?? "None",
                style: TextStyle(fontSize: 18),
              ),
            ]
          ))
        ]
      ),
    );
  }
}
