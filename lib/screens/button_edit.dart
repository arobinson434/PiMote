import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';

Future<void> launchButtonEditor(BuildContext context, String button_name) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _ButtonEditor(name: button_name);
    }
  );
}

class _ButtonEditor extends StatelessWidget {
  final String name;
  const _ButtonEditor({super.key, required String this.name});

  @override
  Widget build(BuildContext context) {
    Provider.of<CmdMgrViewModel>(context, listen: false).listenForCommand();

    return AlertDialog(
      title: Text("Edit: " + name),
      content: Container(
        width: double.maxFinite,
        child: Consumer<CmdMgrViewModel>(
          builder: (context, vmodel, child) {
            return vmodel.listening ?
              Text("Listening...") :
              vmodel.pendingCommand == null ?
                Text("Command not recieved") :
                Text("Recieved command from: ${vmodel.pendingCommand?.name}");
          }
        ),
      ),
      actions: <Widget>[
        Consumer<CmdMgrViewModel>(
          builder: (context, vmodel, child) {
            return Row (
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton (
                  child: const Icon(Icons.delete),
                  onPressed: vmodel.commandKnown(name) ?
                    () {
                      vmodel.removeCommand(name);
                      Navigator.of(context).pop();
                    } :
                    null
                ),
                TextButton(
                  child: const Icon(Icons.save),
                  onPressed: vmodel.pendingCommand != null ?
                    () {
                      vmodel.savePendingCommandAs(name);
                      Navigator.of(context).pop();
                    } :
                    null
                ),
                TextButton(
                  child: const Icon(Icons.close),
                  onPressed: () {
                    vmodel.stopListening();
                    Navigator.of(context).pop();
                  }
                )
              ]
            );
          }
        ),
      ],
    );
  }
}

