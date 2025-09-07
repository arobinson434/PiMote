import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> addRemote(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _NewRemoteWindow();
    }
  );
}

class _NewRemoteWindow extends StatelessWidget {
  const _NewRemoteWindow({super.key});

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
              width: 200,
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name'),
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                SizedBox(
                  width: 95,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Rows')
                  )
                ),
                SizedBox(
                  width: 95,
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(signed:false,decimal:false),
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Columns')
                  )
                ),
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
                print('ToDo: Call the RemoteViewModel\'s newRemote!');
                //onTap: () => Provider.of<RemotesViewModel>(context, listen: false).newRemote()
                Navigator.of(context).pop();
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

