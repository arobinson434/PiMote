import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/components/available_icons.dart';
import 'package:pi_mote/dialogs/icon_selector.dart';
import 'package:pi_mote/dialogs/new_command.dart';
import 'package:pi_mote/storage/button_data.dart';

Future<void> launchButtonEditor(BuildContext context, ButtonData button) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _ButtonEditor(button: button);
    }
  );
}

class _ButtonEditor extends StatefulWidget {
  final ButtonData button;

  const _ButtonEditor({super.key, required this.button});

  @override
  State<_ButtonEditor> createState() => _ButtonEditorState(button: button);
}

class _ButtonEditorState extends State<_ButtonEditor> {
  final ButtonData button;
  int              icon_index;
  CommandDeltas    command;

  _ButtonEditorState({required this.button}):
    icon_index=button.icon_index,
    command=List.from(button.command)
  {}

  bool changesPending() {
    if( icon_index != button.icon_index ||
        !ListEquality().equals(command, button.command) )
      return true;
    return false;
  }

  void iconSelection(BuildContext context) async {
    int new_icon_index = await launchIconSelector(context) ?? 0;

    if( new_icon_index != icon_index )
      setState( (){ icon_index = new_icon_index; } );
  }

  void commandListening(BuildContext context) async {
    CommandDeltas new_command = await launchCommandListener(context) ?? [];

    if( new_command != command )
      setState( (){ command = new_command; } );
  }

  void clearCommand() {
    setState( (){ command.clear(); } );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit Button"),

      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            FilledButton(
              onPressed: () { iconSelection(context); },
              child: AvailableIcons.getIcon(icon_index),
              style: FilledButton.styleFrom(fixedSize: Size(80,40))
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text("Status: "),
                (!ListEquality().equals(command, button.command)) ?
                  Text("Pending Change") :
                  (button.isValid) ?
                    Text("Stored Command") :
                    Text("No Command"),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                TextButton(
                  child: const Icon(Icons.wifi_find),
                  onPressed: () { commandListening(context); },
                ),
                TextButton(
                  child: const Icon(Icons.delete),
                  onPressed: (command.length != 0) ?
                    clearCommand :
                    null
                )
              ]
            )
          ]
        )
      ),

      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: const Icon(Icons.save),
              onPressed: changesPending() ?
                () {
                  button.icon_index = icon_index;
                  button.command    = command;
                  Provider.of<RemoteState>(context, listen: false).saveCurrentRemote();
                  Navigator.of(context).pop();
                } : null,
            ),
            TextButton(
              child: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
        ),
      ]
    );
  }
}

