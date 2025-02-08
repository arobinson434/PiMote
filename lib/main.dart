import 'package:pi_mote/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/viewmodels/devices_viewmodel.dart';
import 'package:pi_mote/viewmodels/cmdmgr_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DevicesViewModel()),
        ChangeNotifierProvider(create: (context) => CmdMgrViewModel()),
      ],
      child: const PiMoteApp(),
    )
  );
}

