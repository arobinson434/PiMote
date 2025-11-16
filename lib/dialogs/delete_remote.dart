import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/storage/remote_data.dart';

Future<void> launchRemoteDelete(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _DeleteConfirmation();
    }
  );
}

class _DeleteConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RemoteData? remote = Provider.of<RemoteState>(context, listen:false).currentRemote;

    if( remote == null )
      throw Exception("DeleteConfirmation called when no remote is set!");

    return AlertDialog(
      title: Text("Delete Remote: ${remote!.name}?"),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                Provider.of<RemoteState>(context, listen: false).currentRemote = null;
                remote!.delete();
                Navigator.of(context).pop();
              }
            ),
            TextButton(
              child: const Text("No"),
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
