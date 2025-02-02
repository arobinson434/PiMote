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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: Icon(Icons.power_settings_new),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: Icon(Icons.add)
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: Icon(Icons.remove)
                    ),
                  ]
                )
              )
            ),
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
        spacing: 8,
        children: [
          FloatingActionButton(
            onPressed: () {} , // TODO: Use this to flip into edit mode
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
