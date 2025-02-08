import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/viewmodels/devices_viewmodel.dart';
import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';
import 'package:pi_mote/screens/scan.dart';
import 'package:pi_mote/components/remote_button.dart';
import 'package:pi_mote/components/remote_pane.dart';

class PiMoteHomePage extends StatelessWidget {
  const PiMoteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("PiMote"),
      ),

      body: RemotePane( children: [
        RemoteButton(
          name: "power",
          child: Icon(Icons.power_settings_new),
        ),
        RemoteButton(
          name: "add",
          child: Icon(Icons.add),
        ),
        RemoteButton(
          name: "remove",
          child: Icon(Icons.remove),
        ),
      ]),

      floatingActionButton: Row( 
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<CmdMgrViewModel>(context, listen: false).toggleLearningEnabled();
            },
            tooltip: 'Edit',
            child: const Icon(Icons.edit),
          ),
          FloatingActionButton(
            onPressed: () => scanForDevices(context),
            tooltip: 'IR Device',
            child: const Icon(Icons.wifi),
          )
        ],
      ),

    );
  }
}
