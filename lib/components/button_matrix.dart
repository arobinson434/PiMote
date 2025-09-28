import 'package:flutter/material.dart';

import 'package:pi_mote/components/remote_button.dart';
import 'package:pi_mote/storage/remote_data.dart';

class ButtonMatrix extends StatelessWidget {
  final ButtonArray buttons;

  const ButtonMatrix({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    int rows  = buttons.length;
    int cols  = buttons.first.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: List.generate(
        rows,
        (row_index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: List.generate(
              cols,
              (col_index) {
                return RemoteButton( data: buttons[row_index][col_index] );
              }
            )
          );
        }
      )
    );
  }
}
