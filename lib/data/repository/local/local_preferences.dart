import 'package:shared_preferences/shared_preferences.dart';

class PreferencesKeys {
  static const String isLoggedIn = 'is_logged_in';
  static const String userId = 'user_id';
  static const String userToken = 'user_token';
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

  Future<void> setUserId(int userId) async {
    await _prefs.setInt(PreferencesKeys.userId, userId);
  }

  int getUserId() {
    return _prefs.getInt(PreferencesKeys.userId) ?? 0;
  }

  Future<void> setUserToken(String userToken) async {
    await _prefs.setString(PreferencesKeys.userToken, userToken);
  }

  String getUserToken() {
    return _prefs.getString(PreferencesKeys.userToken) ?? '';
  }
}
