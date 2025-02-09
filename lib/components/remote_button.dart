import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';
import 'package:pi_mote/screens/edit_button.dart';

class RemoteButton extends StatelessWidget {
  final String name;
  final Widget child;

  RemoteButton({super.key, required this.name, required this.child});

  @override
  Widget build(BuildContext context) {
    return Provider.of<CmdMgrViewModel>(context).learningEnabled ?
      OutlinedButton(
        onPressed: () => launchButtonEditor(context),
        child: child
      ):
      FilledButton(
        onPressed: Provider.of<CmdMgrViewModel>(context).commandAvailable(name) ?
        () {
            Provider.of<CmdMgrViewModel>(context, listen: false).sendCommand(name);
        } : null,
        child: child
      );
  }
}
