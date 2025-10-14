import 'package:hive_ce_flutter/hive_flutter.dart';

typedef CommandDeltas = List<int>;

class ButtonData extends HiveObject {
  CommandDeltas command    = [];
  int           icon_index =  0;

  //bool get isValid => command.length != 0;
  bool get isValid => icon_index != 0;
}
