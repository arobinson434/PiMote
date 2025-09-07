import 'package:flutter/foundation.dart';

typedef RemoteList = List<String>;

class RemotesViewModel extends ChangeNotifier {
  final RemoteList _remotes = [];

  RemotesViewModel() {
    _remotes.add('First');
    _remotes.add('Other');
  }

  RemoteList get remotes => List.unmodifiable(_remotes);

  void newRemote() {
    _remotes.add('addingAnother');
    notifyListeners();
  }
}
