import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:pi_mote/app_state.dart';
import 'package:pi_mote/dialogs/new_remote.dart';
import 'package:pi_mote/storage/hive_boxes.dart';
import 'package:pi_mote/storage/remote_data.dart';

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
            child: ValueListenableBuilder<Box<RemoteData>> (
              valueListenable: Hive.box<RemoteData>(remotes_box_id).listenable(),
              builder: (BuildContext context, Box<RemoteData> box, Widget? _) =>
                box.isEmpty ?
                  Text("No Remotes") :
                  ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (BuildContext context, int index) =>
                      ListTile(
                        leading: const Icon(Icons.settings_remote),
                        title: Text(box.getAt(index)!.name),
                        onTap: () {
                          Provider.of<RemoteState>(context, listen: false).currentRemote = box.getAt(index);
                          Navigator.of(context).pop();
                        }
                      )
                  )
            )
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.add),
              title: const Text('New Remote', style:TextStyle(fontWeight: FontWeight.bold)),
              onTap: () => addRemote(context)
            )
          ),
        ]
      ),
    );
  }
}
