import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/components/button_matrix.dart';
import 'package:pi_mote/storage/hive_boxes.dart';
import 'package:pi_mote/storage/remote_data.dart';

class RemotePane extends StatelessWidget {
  RemotePane({super.key});

  @override
  Widget build(BuildContext context) {
    RemoteData? remote     = Provider.of<PiMoteAppState>(context).currentRemote;
    bool        isLearning = Provider.of<PiMoteAppState>(context).learningMode;
    String?     device     = Provider.of<PiMoteAppState>(context).currentDevice;

    return ValueListenableBuilder<Box<RemoteData>> (
      valueListenable: Hive.box<RemoteData>(remotes_box_id).listenable(),
      builder: (BuildContext context, Box<RemoteData> _, Widget? __) =>
        Padding(
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
              Text(
                isLearning ? "Edit Mode Active" : "",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
              ),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: "Device: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: device ?? "None",
                    style: TextStyle(fontSize: 18),
                  ),
                ]
              ))
            ]
          ),
        )
    );
  }
}
