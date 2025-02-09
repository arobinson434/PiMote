import 'dart:async';
import 'package:flutter/material.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/views/devices_listview.dart';

Future<void> launchButtonEditor(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _ButtonEditor();
    }
  );
}

class _ButtonEditor extends StatefulWidget {
  const _ButtonEditor({super.key});

  @override
  State<_ButtonEditor> createState() => _ButtonEditorState();
}

class _ButtonEditorState extends State<_ButtonEditor> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Listening...'),
      content: Container(
        width: double.maxFinite,
        child: Text("info here, probably"),
      ),
      actions: <Widget>[
        TextButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

