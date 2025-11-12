import 'package:flutter/foundation.dart';

import 'package:pi_mote/storage/remote_data.dart';

class PiMoteAppState extends ChangeNotifier {
  String?     _current_device;
  RemoteData? _current_remote;
  bool        _learning_mode = false;

  String?     get currentDevice => _current_device;
  RemoteData? get currentRemote => _current_remote;
  bool        get learningMode  => _learning_mode;

  set currentDevice(String? value) {
    if ( _current_device != value ) {
      _current_device = value;
      notifyListeners();
    }
  }

  set currentRemote(RemoteData? value) {
    if ( value?.key != _current_remote?.key ) {
      _current_remote = value;
      notifyListeners();
    }
  }

  set learningMode(bool value) {
    if ( _learning_mode != value ) {
      _learning_mode = value;
      notifyListeners();
    }
  }

  void toggleLearningMode() {
    _learning_mode = !_learning_mode;
    notifyListeners();
  }

  void saveCurrentRemote() {
    currentRemote?.save();
  }
}
