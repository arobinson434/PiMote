import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';
import 'package:pi_mote/screens/button_edit.dart';
import 'package:pi_mote/storage/button_data.dart';

class RemoteButton extends StatelessWidget {
  //final String name;
  //final Widget child;

  //RemoteButton({super.key, required this.name, required this.child});

  final ButtonData data;

  RemoteButton({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: null,
      child: Icon(Icons.power_settings_new)
    );
    //return Provider.of<CmdMgrViewModel>(context).learningEnabled ?
    //  // Learning Mode
    //  Provider.of<CmdMgrViewModel>(context).commandKnown(name) ?
    //    FilledButton.tonal( // Known Command
    //      onPressed: () => launchButtonEditor(context, name),
    //      child: child
    //    )
    //    :
    //    OutlinedButton( // No Known Command
    //      onPressed: () => launchButtonEditor(context, name),
    //      child: child
    //    )
    //  :
    //  // Not Learning Mode
    //  FilledButton(
    //    onPressed: Provider.of<CmdMgrViewModel>(context).commandKnown(name) ?
    //      () { // Known Command
    //          Provider.of<CmdMgrViewModel>(context, listen: false).sendCommand(name);
    //      }
    //      :
    //      null, // No Known Command
    //    child: child
    //  );
  }
}
