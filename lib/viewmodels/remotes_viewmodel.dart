import 'package:flutter/foundation.dart';

// Remote Stub
class RemoteControl {
  final String name;
  final int    rows;
  final int    columns;

  RemoteControl(this.name, this.rows, this.columns);
}

typedef RemoteList = List<RemoteControl>;

class RemotesViewModel extends ChangeNotifier {
  final RemoteList _remotes = [];

  RemotesViewModel() {
    // stock for testing; remove later
    _remotes.add(RemoteControl('First',2,3));
    _remotes.add(RemoteControl('Other',3,2));
  }

  RemoteList get remotes => List.unmodifiable(_remotes);

  void newRemote(String name, int rows, int columns) {
    _remotes.add(RemoteControl(name, rows, columns));
    notifyListeners();
  }
}
