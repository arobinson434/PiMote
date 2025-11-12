import 'package:hive_ce/hive.dart';

import 'package:pi_mote/storage/button_data.dart';
import 'package:pi_mote/storage/remote_data.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<RemoteData>(),
  AdapterSpec<ButtonData>()
])

class HiveAdapters {}
