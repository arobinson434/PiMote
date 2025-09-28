import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app.dart';
import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/storage/hive/hive_registrar.g.dart';
import 'package:pi_mote/storage/hive_boxes.dart';
import 'package:pi_mote/storage/remote_data.dart';
import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<RemoteData>(remotes_box_id);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CmdMgrViewModel() ),
        ChangeNotifierProvider(create: (context) => PiMoteAppState() ),
      ],
      child: const PiMoteApp(),
    )
  );
}

