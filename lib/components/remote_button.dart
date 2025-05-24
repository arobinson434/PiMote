import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';
import 'package:pi_mote/screens/button_edit.dart';

class RemoteButton extends StatelessWidget {
  final String name;
  final Widget child;

  RemoteButton({super.key, required this.name, required this.child});

  @override
  Widget build(BuildContext context) {
    return Provider.of<CmdMgrViewModel>(context).learningEnabled ?
      Provider.of<CmdMgrViewModel>(context).commandKnown(name) ?
        FilledButton.tonal( // Learning Mode; Known Command
          onPressed: () => launchButtonEditor(context, name),
          child: child
        )
        :
        OutlinedButton( // Learning Mode; No Known Command
          onPressed: () => launchButtonEditor(context, name),
          child: child
        )
      :
      FilledButton(
        onPressed: Provider.of<CmdMgrViewModel>(context).commandKnown(name) ?
          () { // Not Learning; Known Command
              Provider.of<CmdMgrViewModel>(context, listen: false).sendCommand(name);
          }
          :
          null, // Not Learning; No Known Command
        child: child
      );
  }
}
