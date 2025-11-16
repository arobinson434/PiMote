import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'package:pi_mote/storage/hive_boxes.dart';
import 'package:pi_mote/storage/remote_data.dart';

Future<void> addRemote(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _NewRemoteWindow();
    }
  );
}

class _NewRemoteWindow extends StatefulWidget {
  const _NewRemoteWindow({super.key});

  @override
  State<_NewRemoteWindow> createState() => _NewRemoteWindowState();
}

class _NewRemoteWindowState extends State<_NewRemoteWindow> {
  static const int MAX_ROWS = 9;
  static const int MAX_COLS = 4;

  String? name_error;
  int     row_count = 1;
  int     col_count = 2;

  final TextEditingController name_ctlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Remote'),
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            SizedBox(
              child: TextFormField(
                controller: name_ctlr,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name'),
                forceErrorText: name_error,
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text("Rows:"),
                SizedBox(
                  width: 45,
                  child: DropdownButton<int>(
                    isExpanded: true,
                    value: row_count,
                    onChanged: (int? val) {
                      setState( () { row_count = val ?? 1; } );
                    },
                    items: Iterable<DropdownMenuItem<int>>.generate(
                      MAX_ROWS,
                      (int i) {
                        return DropdownMenuItem<int>(
                          value: i+1,
                          child: Text("${i+1}"),
                          alignment: Alignment.centerRight
                        );
                      }
                    ).toList()
                  )
                ),
                Text("Columns:"),
                SizedBox(
                  width: 45,
                  child: DropdownButton<int>(
                    isExpanded: true,
                    value: col_count,
                    onChanged: (int? val) {
                      setState( () { col_count = val ?? 1; } );
                    },
                    items: Iterable<DropdownMenuItem<int>>.generate(
                      MAX_COLS,
                      (int i) {
                        return DropdownMenuItem<int>(
                          value: i+1,
                          child: Text("${i+1}"),
                          alignment: Alignment.centerRight
                        );
                      }
                    ).toList()
                  )
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
              onPressed: () {
                if( name_ctlr.text.isEmpty ) {
                  setState(() { name_error = "Remote name must not be empty!"; });
                } else {
                  var box = Hive.box<RemoteData>(remotes_box_id);
                  bool exists = box.values.where((remote) => remote.name == name_ctlr.text).isNotEmpty;
                  if ( exists ) {
                    setState(() { name_error = "Remote: ${name_ctlr.text} exists!"; });
                  } else {
                    box.add( RemoteData(name_ctlr.text, row_count, col_count) );
                    Navigator.of(context).pop();
                  }
                }
              }
            ),
            TextButton(
              child: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
        ),
      ],
    );
  }
}

