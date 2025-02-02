import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/viewmodels/emitters_viewmodel.dart';
import 'package:pi_mote/screens/scan.dart';

class PiMoteHomePage extends StatelessWidget {
  const PiMoteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("PiMote"),
      ),
      body: Center(
        child: Text(
          Provider.of<EmittersViewModel>(context).currentEmitter() ?? "None"
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scanForDevices(context),
        tooltip: 'IR Device',
        child: const Icon(Icons.wifi),
      ),
    );
  }
}
