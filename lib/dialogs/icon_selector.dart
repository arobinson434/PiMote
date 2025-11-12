import 'dart:async';
import 'package:flutter/material.dart';

import 'package:pi_mote/components/available_icons.dart';

Future<int?> launchIconSelector(BuildContext context) {
  return showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      return _IconSelector();
    }
  );
}

class _IconSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select Icon"),
      content: SizedBox(
        width: double.maxFinite,
        child: GridView.count(
          crossAxisCount: 3,
          children: List<Widget>.generate(AvailableIcons.icons.length, (int i) {
            return UnconstrainedBox(
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).pop(i);
                },
                child: AvailableIcons.getIcon(i),
                style: FilledButton.styleFrom(fixedSize: Size(80,40))
              )
            );
          }),
        )
      )
    );
  }
}
