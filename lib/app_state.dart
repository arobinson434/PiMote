import 'package:flutter/foundation.dart';

import 'package:pi_mote/storage/remote_data.dart';

class RemoteState extends ChangeNotifier {
  RemoteData? _current_remote;

  RemoteData? get currentRemote => _current_remote;

  set currentRemote(RemoteData? value) {
    if ( value?.key != _current_remote?.key ) {
      _current_remote = value;
      notifyListeners();
    }
  }

  void saveCurrentRemote() {
    currentRemote?.save();
  }
}

class DeviceState extends ChangeNotifier {
  String? _current_device;

  String? get currentDevice => _current_device;

  set currentDevice(String? value) {
    if ( _current_device != value ) {
      _current_device = value;
      notifyListeners();
    }
  }
}

class LearningState extends ChangeNotifier {
  bool _learning_mode = false;

  bool get learningMode  => _learning_mode;

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
}
