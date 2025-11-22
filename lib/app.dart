import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/home.dart';
import 'package:pi_mote/app_state.dart';

class PiMoteApp extends StatelessWidget {
  const PiMoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool darkMode = Provider.of<AppearanceState>(context).darkMode;

    return MaterialApp(
      title: 'PiMote',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple.shade900,
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const PiMoteHomePage(),
    );
  }
}

