import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late final SharedPreferences _prefs;

  Future<void> ensureInitialized() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> saveString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> saveBool(String key, bool value) async {
    return _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<bool> saveInt(String key, int value) async {
    return _prefs.setInt(key, value);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  Future<bool> saveDouble(String key, double value) async {
    return _prefs.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  Future<bool> saveStringList(String key, List<String> value) async {
    return _prefs.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }

  Future<bool> clear() async {
    return _prefs.clear();
  }
}
