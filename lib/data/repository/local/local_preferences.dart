import 'package:shared_preferences/shared_preferences.dart';

class PreferencesKeys {
  static const String isLoggedIn = 'is_logged_in';
  static const String userKey = 'user_key';
}

class LocalPreferences {
  final SharedPreferences _prefs;

  LocalPreferences(this._prefs);

  Future<void> setIsLoggedIn(bool isLoggedIn) async {
    await _prefs.setBool(PreferencesKeys.isLoggedIn, isLoggedIn);
  }

  bool getIsLoggedIn() {
    return _prefs.getBool(PreferencesKeys.isLoggedIn) ?? false;
  }

  Future<void> setUserKey(int key) async {
    await _prefs.setInt(PreferencesKeys.userKey, key);
  }

  int getUserKey() {
    return _prefs.getInt(PreferencesKeys.userKey) ?? 0;
  }
}
