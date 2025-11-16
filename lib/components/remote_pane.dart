import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/components/button_matrix.dart';
import 'package:pi_mote/storage/remote_data.dart';

class RemotePane extends StatelessWidget {
  RemotePane({super.key});

  @override
  Widget build(BuildContext context) {
    RemoteData? remote = Provider.of<RemoteState>(context).currentRemote;

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
              child: remote != null ? ButtonMatrix(buttons: remote!.buttons) : null
            )
          ),
          Builder(
            builder: (BuildContext c) {
              return Text(
                Provider.of<LearningState>(c).learningMode ? "Edit Mode Active" : "",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
              );
            }
          ),
          Builder(
            builder: (BuildContext c) {
              return Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: "Device: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: Provider.of<DeviceState>(c).currentDevice ?? "None",
                    style: TextStyle(fontSize: 18),
                  ),
                ]
              ));
            }
          )
        ]
      )
    );
  }
}
