import 'package:flutter/foundation.dart';

import 'package:pi_mote/models/devices_model.dart';

class DevicesViewModel extends ChangeNotifier {
  final DevicesModel _model    = DevicesModel();
  final Devices      _devices = {};
  String?             _current;

  DevicesViewModel() {
    _model.getEventStream().listen(processEmittingEntity);
  }

  void processEmittingEntity(EmittingEntity entity) {
    _devices[entity.name] = entity.data;
    notifyListeners();
  }

  Devices get devices => Map.unmodifiable(_devices);

  String? currentDevice() => _current;

  void setCurrentDevice(String? value) {
    _current = value;
    notifyListeners();
  }
}
