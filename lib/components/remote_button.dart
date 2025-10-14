import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';
import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/screens/button_edit.dart';
import 'package:pi_mote/storage/button_data.dart';

class RemoteButton extends StatelessWidget {
  //final String name;
  //final Widget child;

  //RemoteButton({super.key, required this.name, required this.child});

  final ButtonData button;

  RemoteButton({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    // If this changes, our parent rebuilds, so no need to listen here.
    bool isLearning = Provider.of<PiMoteAppState>(context, listen:false).learningMode;

    if ( button.isValid && !isLearning ) {
      return FilledButton(
        onPressed: () {
          /* TODO: trigger command send*/ 
          button.icon_index++;
          Provider.of<PiMoteAppState>(context, listen: false).currentRemote!.save();
        },
        child: Text("${button.icon_index}")
      );
    } else if ( button.isValid && isLearning ) {
      return FilledButton.tonal( 
        onPressed: () {
          /* TODO: launch editor*/ 
          button.icon_index--;
          Provider.of<PiMoteAppState>(context, listen: false).currentRemote!.save();
        },
        child: Text("${button.icon_index}")
      );
    } else if ( !button.isValid && !isLearning ) {
      return FilledButton(
        onPressed: null,
        child: Icon(null)//Text(" ")
      );
    } else { // !button.isValid && isLearning
      return OutlinedButton(
        onPressed: () {
          button.icon_index++;
          Provider.of<PiMoteAppState>(context, listen: false).currentRemote!.save();
        },
        child: Text("${button.icon_index}")
      );
    }

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
