import 'package:flutter/foundation.dart';

import 'package:pi_mote/models/emitters_model.dart';

class EmittersViewModel extends ChangeNotifier {
  final EmittersModel _model    = EmittersModel();
  final Emitters      _emitters = {};
  String?             _current;

  EmittersViewModel() {
    _model.getEventStream().listen(processEmittingEntity);
  }

  void processEmittingEntity(EmittingEntity entity) {
    _emitters[entity.name] = entity.data;
    notifyListeners();
  }

  Emitters get emitters => Map.unmodifiable(_emitters);

  String? currentEmitter() => _current;

  void setCurrentEmitter(String? value) {
    _current = value;
    notifyListeners();
  }
}
