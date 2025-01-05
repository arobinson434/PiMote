import 'package:flutter/material.dart';
import 'package:pi_mote/models/emitters_model.dart';
import 'package:pi_mote/viewmodels/emitters_viewmodel.dart';
import 'package:pi_mote/views/emitters_listview.dart';

class PiMoteHomePage extends StatefulWidget {
  const PiMoteHomePage({super.key});

  @override
  State<PiMoteHomePage> createState() => _PiMoteHomePageState();
}

class _PiMoteHomePageState extends State<PiMoteHomePage> {
  final EmittersViewModel viewmodel = EmittersViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("PiMote"),
      ),
      body: Center(
        child: EmittersListView(viewmodel: viewmodel)
      )
    );
  }
}
