import 'package:flutter/material.dart';

class AvailableIcons {
  static const List<Widget> icons = [
    Icon(null),
    Text("0"),
    Text("1"),
    Text("2"),
    Text("3"),
    Text("4"),
    Text("5"),
    Text("6"),
    Text("7"),
    Text("8"),
    Text("9"),
    Text("A"),
    Text("B"),
    Text("C"),
    Text("D"),
    Text("OK"),
    Text("Exit"),
    Icon(Icons.power_settings_new),
    Icon(Icons.add),
    Icon(Icons.remove),
    Icon(Icons.arrow_left),
    Icon(Icons.arrow_right),
    Icon(Icons.arrow_drop_up),
    Icon(Icons.arrow_drop_down),
    Icon(Icons.check),
    Icon(Icons.input),
    Icon(Icons.menu),
    Icon(Icons.close),
  ];

  static Widget getIcon(int index) {
    if( index >= 0 && index < icons.length )
      return icons[index];
    else
      return Icon(null);
  }
}

