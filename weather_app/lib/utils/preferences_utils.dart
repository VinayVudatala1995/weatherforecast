// ignore_for_file: non_constant_identifier_names

import 'dart:async' show Future;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future<dynamic> getValue<T>(String key, T defValue) async {
    var prefs = await _instance;
    switch (T) {
      case String:
        return prefs.getString(key) ?? defValue ?? "";
      case int:
        return prefs.getInt(key) ?? defValue ?? 0;
      case double:
        return prefs.getDouble(key) ?? defValue ?? 0;
      case bool:
        return prefs.getBool(key) ?? defValue ?? false;
      case const (List<String>):
        return prefs.getStringList(key) ?? defValue ?? List.empty();
      default:
        debugPrint("SharedPreferences Invalid key ${key.toString()}");
        return Future.value(false);
    }
  }

  static Future<bool> remove(String key) async {
    var prefs = await _instance;
    return prefs.remove(key);
  }

  static removeKeys() async {
    await _prefsInstance!.remove(PreferencesConstants.CURRENT);
    await _prefsInstance!.remove(PreferencesConstants.HOURLY);
    
    
    log("License key files deleted");
  }

  static Future<bool> setValue<T>(
    String key,
    T value,
  ) async {
    var prefs = await _instance;

    switch (T) {
      case String:
        return prefs.setString(key, value as String);
      case int:
        return prefs.setInt(key, value as int);
      case double:
        return prefs.setDouble(key, value as double);
      case bool:
        return prefs.setBool(key, value as bool);
      case const (List<String>):
        return prefs.setStringList(key, value as List<String>);
      default:
        debugPrint("SharedPreferences Invalid value $value");
        return Future.value(false);
    }

    // return prefs.setString(key, value); // ?? Future.value(false);
  }
}

class PreferencesConstants {
  static String CURRENT = "CURRENT";
  static String HOURLY = "HOURLY";
  
}
