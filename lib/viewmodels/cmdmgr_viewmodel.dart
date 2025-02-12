import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';

import 'package:pi_mote/messages/ir_command.pb.dart';
import 'package:pi_mote/models/cmdmgr_model.dart';

typedef Commands = Map<String, IrCommand>;

class CmdMgrViewModel extends ChangeNotifier {
  final CmdMgrModel _model    = CmdMgrModel();
  final Commands    _commands = Commands();

  IrCommand? _pendingCommand;
  IrCommand? get pendingCommand => _pendingCommand;

  CancelableOperation? _commandFuture;

  bool _learningEnabled   = false;
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

  Future<void> listenForCommand() async {
    _pendingCommand = null;
    _commandFuture = CancelableOperation.fromFuture(
      _model.getCommand()
    );

    IrCommand? result = await _commandFuture?.valueOrCancellation();

    if ( result != null ) {
      _pendingCommand = result!;
      notifyListeners();
    }
  }

  void stopListening() {
    _commandFuture?.cancel();
  }

  void saveCommandAs(IrCommand cmd, String name) {
    _commands[name] = cmd;
  }

  Future<void> sendCommand(String name) {
    return _model.sendCommand( _commands[name]! );
  }

  bool commandKnown(String name) {
    return _commands.containsKey(name);
  }
}
