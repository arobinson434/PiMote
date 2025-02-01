import 'package:pi_mote/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/viewmodels/emitters_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EmittersViewModel(),
      child: const PiMoteApp(),
    )
  );
}

