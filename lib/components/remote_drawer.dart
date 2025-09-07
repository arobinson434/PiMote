import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/viewmodels/remotes_viewmodel.dart';
import 'package:pi_mote/screens/new_remote.dart';

class RemoteDrawer extends StatelessWidget {
  const RemoteDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.maxFinite,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary),
              child: const Text('Remotes', style:TextStyle(fontSize: 24))
            )
          ),

          Expanded(
            child: Consumer<RemotesViewModel> (
              builder: (context, vmodel, child) {
                return ListView.builder(
                  itemCount: vmodel.remotes.length,
                  itemBuilder: (context, idx) {
                    return ListTile(
                      leading: const Icon(Icons.settings_remote),
                      title: Text(vmodel.remotes[idx].name),
                      onTap: () => print('should reload main widget with new remote')
                    );
                  }
                );
              }
            )
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.add),
              title: const Text('New Remote', style:TextStyle(fontWeight: FontWeight.bold)),
              //onTap: () => Provider.of<RemotesViewModel>(context, listen: false).newRemote()
              onTap: () => addRemote(context)
            )
          ),
        ]
      ),
    );
  }
}
