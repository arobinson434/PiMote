import 'package:flutter/material.dart';
import 'package:pi_mote/models/emitters_model.dart';
import 'package:pi_mote/viewmodels/emitters_viewmodel.dart';
import 'package:pi_mote/views/emitters_listview.dart';

class PiMoteHomePage extends StatefulWidget {
  const PiMoteHomePage({super.key, required this.title});

  final String title;

  @override
  State<PiMoteHomePage> createState() => _PiMoteHomePageState();
}

class _PiMoteHomePageState extends State<PiMoteHomePage> {
  int _counter = 0;

  final EmittersModel model;
  late final EmittersViewModel evm;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _PiMoteHomePageState():
    model = EmittersModel() {
      evm = EmittersViewModel(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: EmittersListView(viewmodel:evm)
          //Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
          //  const Text(
          //    'You have pushed the button this many times:',
          //  ),
          //  Text(
          //    '$_counter',
          //    style: Theme.of(context).textTheme.headlineMedium,
          //  ),
          //  ListenableBuilder(
          //    listenable: evm,
          //    builder: (BuildContext context, Widget? child) {
          //      return  Text( 'Name: ${evm.name}');
          //    },
          //  )
          //],
          //),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
