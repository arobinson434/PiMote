import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/dialogs/device_scan.dart';
import 'package:pi_mote/components/remote_button.dart';
import 'package:pi_mote/components/remote_pane.dart';
import 'package:pi_mote/components/remote_drawer.dart';

class PiMoteHomePage extends StatelessWidget {
  const PiMoteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Image.asset('assets/heading_logo.png', height: 90)
        ),
      ),

      body: RemotePane(),

      floatingActionButton: Row( 
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<LearningState>(context, listen: false).toggleLearningMode();
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

      drawer: RemoteDrawer(),
    );
  }
}
