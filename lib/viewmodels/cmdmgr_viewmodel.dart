import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:pi_mote/messages/ir_command.pb.dart';
import 'package:pi_mote/models/cmdmgr_model.dart';

typedef Commands = Map<String, IrCommand>;

class CmdMgrViewModel extends ChangeNotifier {
  final CmdMgrModel _model    = CmdMgrModel();
  final Commands    _commands = Commands();

  bool  _learningEnabled   = false;
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

  Future<IrCommand?> listenForCommand() => _model.getCommand();

  void saveCommandAs(IrCommand cmd, String name) {
    _commands[name] = cmd;
  }

  Future<void> sendCommand(String name) {
    return _model.sendCommand( _commands[name]! );
  }

  bool commandAvailable(String name) {
    return _commands.containsKey(name);
  }
}
