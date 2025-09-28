import 'package:flutter/foundation.dart';

class PiMoteAppState extends ChangeNotifier {
  String? _current_device;
  bool    _learning_mode = false;

  String? get currentDevice => _current_device;
  bool    get learningMode  => _learning_mode;

  set currentDevice(String? value) {
    if ( _current_device != value ) {
      _current_device = value;
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
}
