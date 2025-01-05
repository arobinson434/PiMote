import 'package:flutter/foundation.dart';
import 'package:pi_mote/models/emitters_model.dart';

class EmittersViewModel extends ChangeNotifier {
  final EmittersModel model;
  String name = "";
  Emitters emitters = {};

  EmittersViewModel(this.model) {
    model.getEventStream().listen(processEmittingEntity);
  }

  void processEmittingEntity(EmittingEntity entity) {
    name = entity.name;

    if ( !emitters.containsKey(entity.name) ) {
      emitters[entity.name] = entity.data;

      notifyListeners();
    } else {
      emitters[entity.name]?.last_reported = entity.data.last_reported;
      if ( emitters[entity.name]?.ip_addr != entity.data.ip_addr )
        emitters[entity.name]?.ip_addr = entity.data.ip_addr;

      notifyListeners();
    } 

    print("EmittersViewModel::processEmittingEntity:");
    print("\tname: ${entity.name}");
    print("\tdesc: ${entity.data.description}");
    print("\tip:   ${entity.data.ip_addr}");
    print("\tdate: ${entity.data.last_reported}");
  }
}
