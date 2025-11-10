import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/components/available_icons.dart';
import 'package:pi_mote/screens/icon_selector.dart';
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
    command=button.command
  {}

  bool changesPending() {
    if( icon_index != button.icon_index ||
        command    != button.command )
      return true;
    return false;
  }

  void iconSelection(BuildContext context) async {
    int new_icon_index = await launchIconSelector(context) ?? 0;

    if( new_icon_index != icon_index )
      setState( (){ icon_index = new_icon_index; } );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Button Editor"),

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
                  Provider.of<PiMoteAppState>(context, listen: false).saveCurrentRemote();
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

