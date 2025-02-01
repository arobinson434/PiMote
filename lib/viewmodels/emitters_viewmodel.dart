import 'package:flutter/foundation.dart';

import 'package:pi_mote/models/emitters_model.dart';

class EmittersViewModel extends ChangeNotifier {
  final EmittersModel _model   = EmittersModel();
  final Emitters      emitters = {};

  EmittersViewModel() {
    _model.getEventStream().listen(processEmittingEntity);
  }

  void processEmittingEntity(EmittingEntity entity) {
    if ( !emitters.containsKey(entity.name) ) {
      emitters[entity.name] = entity.data;
      notifyListeners();
    } else {
      if ( emitters[entity.name]?.ip_addr != entity.data.ip_addr )
        emitters[entity.name]?.ip_addr = entity.data.ip_addr;
      emitters[entity.name]?.last_reported = entity.data.last_reported;
      notifyListeners();
    } 
  }
}
