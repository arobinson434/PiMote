import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';

class RemoteButton extends StatelessWidget {
  final String name;
  final Widget child;

  RemoteButton({super.key, required this.name, required this.child});

  @override
  Widget build(BuildContext context) {
    return Provider.of<CmdMgrViewModel>(context).learningEnabled ?
      OutlinedButton(
        onPressed: () => print("DEBUG: Button: ${name}; Pressed in Edit-Mode"),
        child: child
      ):
      FilledButton(
        onPressed: () => print("DEBUG: Button: ${name}; Pressed in Command-Mode"),
        child: child
      );
  }
}
