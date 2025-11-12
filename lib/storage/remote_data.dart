import 'package:hive_ce_flutter/hive_flutter.dart';

import 'package:pi_mote/storage/button_data.dart';

typedef ButtonArray = List<List<ButtonData>>;

class RemoteData extends HiveObject {
  final String name;
  final int    rows;
  final int    columns;

  late ButtonArray buttons = ButtonArray.generate(
    rows,
    (r) => List<ButtonData>.generate(
      columns,
      (c) => ButtonData(),
      growable: false
    ), 
    growable: false
  );

  RemoteData(this.name, this.rows, this.columns);
}
