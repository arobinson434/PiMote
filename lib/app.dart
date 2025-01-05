import 'package:flutter/material.dart';
import 'package:pi_mote/screens/home.dart';

class PiMoteApp extends StatelessWidget {
  const PiMoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PiMote',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PiMoteHomePage(title: 'PiMote'),
    );
  }
}

