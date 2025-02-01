import 'package:flutter/material.dart';

import 'package:pi_mote/views/emitters_listview.dart';
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
        child: EmittersListView(detailed: true)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scanForDevices(context),
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
