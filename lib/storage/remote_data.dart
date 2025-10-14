import 'package:hive_ce_flutter/hive_flutter.dart';

import 'package:pi_mote/storage/button_data.dart';

typedef ButtonArray = List<List<ButtonData>>;

typedef TestArray = List<List<int>>;

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

  late TestArray test_array = TestArray.generate(
    rows,
    (r) => List<int>.generate(
      columns,
      (c) => 0,
      growable: false
    ),
    growable: false
  );

  RemoteData(this.name, this.rows, this.columns);
}
