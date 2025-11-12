import 'dart:async';
import 'package:flutter/material.dart';

import 'package:pi_mote/comms/command_receiver.dart';
import 'package:pi_mote/storage/button_data.dart';

Future<CommandDeltas?> launchCommandListener(BuildContext context) {
  return showDialog<CommandDeltas>(
    context: context,
    builder: (BuildContext context) {
      return _CommandListener();
    }
  );
}

class _CommandListener extends StatefulWidget {
  const _CommandListener({super.key});

  @override
  State<_CommandListener> createState() => _CommandListenerState();
}

class _CommandListenerState extends State<_CommandListener> {
  CommandInfo? command_info;
  final CommandReceiver _receiver = CommandReceiver();

  @override
  void initState() {
    super.initState();
    _receiver.init().then(beginListening); //TODO: clean this up
  }

  @override
  void dispose() {
    _receiver.dispose();
    super.dispose();
  }

  FutureOr<dynamic> beginListening(void _) {
    _receiver.getCommand().then(commandReceived);
  }

  FutureOr<void> commandReceived(CommandInfo? info) {
    if( info != null )
      setState( (){ command_info = info; } );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Listening..."),

      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (command_info == null) ?
              Text("Listening for command") :
              Text("Command received from: ${command_info?.name}")
          ]
        )
      ),

      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: const Icon(Icons.save),
              onPressed: (command_info != null) ?
                () {
                  Navigator.of(context).pop(command_info?.command);
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
