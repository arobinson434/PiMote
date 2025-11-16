import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/dialogs/delete_remote.dart';
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

      floatingActionButton: Builder(
        builder: (BuildContext c) {
          bool isLearning = Provider.of<LearningState>(c).learningMode;

          List<Widget> children = [];

          if( isLearning )
            children.add(
              FloatingActionButton(
                onPressed: () { launchRemoteDelete(c); },
                tooltip: 'Delete',
                child: const Icon(Icons.delete),
              )
            );

          children.add(
            FloatingActionButton(
              onPressed: () {
                Provider.of<LearningState>(c, listen: false).toggleLearningMode();
              },
              tooltip: 'Edit',
              child: const Icon(Icons.edit),
              foregroundColor: isLearning ? Colors.white  : null,
              backgroundColor: isLearning ? Colors.indigo : null,
            )
          );

          children.add(
            FloatingActionButton(
              onPressed: () => scanForDevices(context),
              tooltip: 'IR Device',
              child: const Icon(Icons.wifi),
            )
          );

          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 8,
            children: children,
          );
        }
      ),

      drawer: RemoteDrawer(),
    );
  }
}
