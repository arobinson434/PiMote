import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pi_mote/storage/remote_data.dart';
import 'package:pi_mote/storage/hive_boxes.dart';

class RemoteState extends ChangeNotifier {
  RemoteData? _current_remote;

  RemoteData? get currentRemote => _current_remote;

  set currentRemote(RemoteData? value) {
    if ( value?.key != _current_remote?.key ) {
      _current_remote = value;
      _storeToCache();
      notifyListeners();
    }
  }

  void saveCurrentRemote() {
    currentRemote?.save();
  }

  void _storeToCache() async {
    final SharedPreferencesWithCache cache =
      await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions()
      );

    if( _current_remote == null )
      cache.remove('remote_index');
    else {
      if( _current_remote!.box != null )
        cache.setInt('remote_index',
          _current_remote!.box!.keys.toList().indexOf(_current_remote!.key));
    }
  }

  void _loadFromCache() async {
    final SharedPreferencesWithCache cache =
      await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions()
      );

    int remote_index = cache.getInt('remote_index') ?? -1;
    if( remote_index >= 0 ) {
      _current_remote = Hive.box<RemoteData>(remotes_box_id).getAt(remote_index);
      notifyListeners();
    }
  }

  RemoteState() {
    _loadFromCache();
  }
}

class DeviceState extends ChangeNotifier {
  String? _current_device;

  String? get currentDevice => _current_device;

  set currentDevice(String? value) {
    if ( _current_device != value ) {
      _current_device = value;
      _storeToCache();
      notifyListeners();
    }
  }

  void _storeToCache() async {
    final SharedPreferencesWithCache cache =
      await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions()
      );

    if( _current_device == null )
      cache.remove('device_name');
    else
      cache.setString('device_name', _current_device!);
  }

  void _loadFromCache() async {
    final SharedPreferencesWithCache cache =
      await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions()
      );

    _current_device = cache.getString('device_name');

    notifyListeners();
  }

  DeviceState() {
    _loadFromCache();
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
