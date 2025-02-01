import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/models/emitters_model.dart';
import 'package:pi_mote/viewmodels/emitters_viewmodel.dart';

class EmittersListView extends StatelessWidget {
  final bool detailed;
  EmittersListView({super.key, this.detailed = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmittersViewModel> (
      builder: (context, vmodel, child) {
        return ListView.builder(
          itemCount: vmodel.emitters.length,
          itemBuilder: (context, idx) {
            final String key = vmodel.emitters.keys.elementAt(idx);
            return EmitterView(
              name: key, data: vmodel.emitters[key], showDetails: detailed
            );
          }
        );
      }
    );
  }
}

class EmitterView extends StatelessWidget {
  final String       name;
  final EmitterData? data;
  final bool         showDetails;

  EmitterView({super.key, required this.name, 
    required this.data, this.showDetails = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.circle, color: Colors.green),
        title: Text(name),
        subtitle: showDetails ?
          Text('Description: ${data?.description}\nIP: ${data?.ip_addr}') :
          null,
      ),
    );
  }
}
