import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';

import 'package:pi_mote/messages/ir_command.pb.dart';
import 'package:pi_mote/models/cmdmgr_model.dart';

typedef Commands = Map<String, IrCommand>;

class CmdMgrViewModel extends ChangeNotifier {
  final CmdMgrModel _model    = CmdMgrModel();
  final Commands    _commands = Commands();

  bool _listening = false;
  bool get listening => _listening;

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
    _listening      = true;
    _pendingCommand = null;
    _commandFuture  = CancelableOperation.fromFuture(
      _model.getCommand()
    );

    _pendingCommand = await _commandFuture?.valueOrCancellation();

    _listening = false;
    notifyListeners();
  }

  void stopListening() {
    _commandFuture?.cancel();
  }

  void savePendingCommandAs(String name) {
    _commands[name] = _pendingCommand!;
    notifyListeners();
  }

  void removeCommand(String name) {
    _commands.remove(name);
    notifyListeners();
  }

  Future<void> sendCommand(String name) {
    return _model.sendCommand( _commands[name]! );
  }

  bool commandKnown(String name) {
    return _commands.containsKey(name);
  }
}
