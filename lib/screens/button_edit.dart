import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';
import 'package:pi_mote/views/devices_listview.dart';

Future<void> launchButtonEditor(BuildContext context, String button_name) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _ButtonEditor(name: button_name);
    }
  );
}

class _ButtonEditor extends StatefulWidget {
  final String name;
  const _ButtonEditor({super.key, required String this.name});

  @override
  State<_ButtonEditor> createState() => _ButtonEditorState();
}

class _ButtonEditorState extends State<_ButtonEditor> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit: " + widget.name),
      content: Container(
        width: double.maxFinite,
        child: Consumer<CmdMgrViewModel>(
          builder: (context, vmodel, child) {
            return vmodel.pendingCommand == null ?
              Text("Listening...") :
              Text("Recieved command from: ${vmodel.pendingCommand?.name}");
          }
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Provider.of<CmdMgrViewModel>(context, listen: false).stopListening();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

