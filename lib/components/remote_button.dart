import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/comms/command_sender.dart';
import 'package:pi_mote/components/available_icons.dart';
import 'package:pi_mote/dialogs/button_edit.dart';
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
          String? device = Provider.of<PiMoteAppState>(context, listen:false).currentDevice;
          if( device != null )
            CommandSender.send(button.command, device);
        },
        child: AvailableIcons.getIcon(button.icon_index),
        style: FilledButton.styleFrom(fixedSize: Size(80,40))
      );
    } else if ( button.isValid && isLearning ) {
      return FilledButton.tonal( 
        onPressed: () {
          launchButtonEditor(context, button);
        },
        child: AvailableIcons.getIcon(button.icon_index),
        style: FilledButton.styleFrom(fixedSize: Size(80,40))
      );
    } else if ( !button.isValid && !isLearning ) {
      return FilledButton(
        onPressed: null,
        child: AvailableIcons.getIcon(button.icon_index),
        style: FilledButton.styleFrom(fixedSize: Size(80,40))
      );
    } else { // !button.isValid && isLearning
      return OutlinedButton(
        onPressed: () {
          launchButtonEditor(context, button);
        },
        child: AvailableIcons.getIcon(button.icon_index),
        style: OutlinedButton.styleFrom(fixedSize: Size(80,40))
      );
    }
  }
}
