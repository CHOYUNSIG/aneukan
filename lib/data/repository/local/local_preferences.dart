import 'package:shared_preferences/shared_preferences.dart';

class PreferencesKeys {
  static const String isLoggedIn = 'is_logged_in';
  static const String userId = 'user_id';
  static const String userToken = 'user_token';
}

class LocalPreferences {
  final SharedPreferences _prefs;

  LocalPreferences(this._prefs);

  // 로그인 상태 저장
  Future<void> setIsLoggedIn(bool isLoggedIn) async {
    await _prefs.setBool(PreferencesKeys.isLoggedIn, isLoggedIn);
  }

  // 로그인 상태 조회
  bool getIsLoggedIn() {
    return _prefs.getBool(PreferencesKeys.isLoggedIn) ?? false;
  }

  // 유저 아이디 저장
  Future<void> setUserId(String userId) async {
    await _prefs.setString(PreferencesKeys.userId, userId);
  }

  // 유저 아이디 조회
  String getUserId() {
    return _prefs.getString(PreferencesKeys.userId) ?? '';
  }

  // 유저 토큰 저장
  Future<void> setUserToken(String userToken) async {
    await _prefs.setString(PreferencesKeys.userToken, userToken);
  }

  // 유저 토큰 조회
  String getUserToken() {
    return _prefs.getString(PreferencesKeys.userToken) ?? '';
  }
}
