import 'package:flutter/material.dart';
import 'package:pi_mote/models/emitters_model.dart';
import 'package:pi_mote/viewmodels/emitters_viewmodel.dart';

class EmittersListView extends StatelessWidget {
  final EmittersViewModel viewmodel;

  EmittersListView({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewmodel,
      builder: (BuildContext context, Widget? child) {
        return ListView.builder(
          itemCount: viewmodel.emitters.length,
          itemBuilder: (context, idx) {
            final String key = viewmodel.emitters.keys.elementAt(idx);
            return EmitterView(name: key, data: viewmodel.emitters[key]);
          });
      }
    );
  }
}

class EmitterView extends StatelessWidget {
  final String       name;
  final EmitterData? data;

  EmitterView({super.key, required this.name, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.circle, color: Colors.green),
        title: Text(name),
        subtitle: Text('Description: ${data?.description}\nIP: ${data?.ip_addr}'),
      ),
    );
  }
}
