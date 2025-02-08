import 'package:flutter/foundation.dart';

class CmdMgrViewModel extends ChangeNotifier {
  bool _learningEnabled = false;

  bool get learningEnabled => _learningEnabled;
  void set learningEnabled(bool enabled) {
    if ( enabled != _learningEnabled ) {
      _learningEnabled = enabled;
      notifyListeners();
    }
  }

  void toggleLearningEnabled() {
    _learningEnabled = !_learningEnabled;
    notifyListeners();
  }
}
