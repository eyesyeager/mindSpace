import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CacheService extends GetxService {
  static CacheService get to => Get.find();
  late final SharedPreferences _prefs;

  Future<CacheService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  Future<bool> addListByValue(String key, String value) async {
    List<String> list = getList(key);
    list.add(value);
    return setList(key, list);
  }

  Future<bool> setJson(String key, Map<String, dynamic> value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Map<String, dynamic> getJson(String key) {
    String? jsonString = _prefs.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return {};
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> removeListByIndex(String key, int index) async {
    List<String> list = getList(key);
    if (list.isEmpty) {
      return true;
    }
    list.removeAt(index);
    return setList(key, list);
  }

  Future<bool> removeListByValue(String key, String value) async {
    List<String> list = getList(key);
    if (list.isEmpty) {
      return true;
    }
    for (int i = list.length - 1; i >= 0; i--) {
      if (list[i] == value) {
        list.removeAt(i);
        break;
      }
    }
    return setList(key, list);
  }
}