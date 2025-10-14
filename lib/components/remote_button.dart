import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/screens/button_edit.dart';
import 'package:pi_mote/storage/button_data.dart';

class RemoteButton extends StatelessWidget {
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
        child: Text("${button.icon_index}"),
        style: FilledButton.styleFrom(fixedSize: Size(80,40))
      );
    } else if ( button.isValid && isLearning ) {
      return FilledButton.tonal( 
        onPressed: () {
          /* TODO: launch editor*/ 
          button.icon_index--;
          Provider.of<PiMoteAppState>(context, listen: false).currentRemote!.save();
        },
        child: Text("${button.icon_index}"),
        style: FilledButton.styleFrom(fixedSize: Size(80,40))
      );
    } else if ( !button.isValid && !isLearning ) {
      return FilledButton(
        onPressed: null,
        child: Icon(null),//Text(" ")
        style: FilledButton.styleFrom(fixedSize: Size(80,40))
      );
    } else { // !button.isValid && isLearning
      return OutlinedButton(
        onPressed: () {
          button.icon_index++;
          Provider.of<PiMoteAppState>(context, listen: false).currentRemote!.save();
        },
        child: Text("${button.icon_index}"),
        style: OutlinedButton.styleFrom(fixedSize: Size(80,40))
      );
    }
  }
}
