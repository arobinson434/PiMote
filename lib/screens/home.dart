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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: "Device: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: Provider.of<EmittersViewModel>(context).currentEmitter() ?? "None",
                  style: TextStyle(fontSize: 18),
                ),
              ]
            ))
          ]
        ),
      ),
      floatingActionButton: Row( 
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: FloatingActionButton(
              onPressed: () {} , // TODO: Use this to flip into edit mode
              tooltip: 'Edit',
              child: const Icon(Icons.edit),
            ),
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
