import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/components/remote_button.dart';
import 'package:pi_mote/storage/remote_data.dart';

class RemotePane extends StatelessWidget {
  final RemoteData? remote;

  RemotePane({super.key, required this.remote});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Remote: ${remote?.name ?? 'Not Selected'}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)
            )
          ),
          Expanded(
            child: Center(
              //child: ButtonMatrix(remote?.buttons)
              child: null
              //child: Text("Remote: ${remote?.name ?? 'Not Selected'}")
              //child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              //  spacing: 10,
              //  children: children, // <-- Parent's buttons
              //)
            )
          ),
          Text(
            Provider.of<PiMoteAppState>(context).learningMode ?
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
                text: Provider.of<PiMoteAppState>(context).currentDevice ?? "None",
                style: TextStyle(fontSize: 18),
              ),
            ]
          ))
        ]
      ),
    );
  }
}
