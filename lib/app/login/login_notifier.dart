import 'package:aneukan/app/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:aneukan/data/repository/network/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:aneukan/app/home/home_page.dart';
import 'package:aneukan/data/repository/local/local_preferences.dart';

final getIt = GetIt.instance;

class LoginNotifier extends ChangeNotifier {
  String id = '';
  String password = '';

  void setId(String id) {
    this.id = id;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  void login(BuildContext Function() getContext) {
    getIt<ApiService>().login(id, password).then((value) {
      final preferences = getIt<LocalPreferences>();
      preferences.setUserKey(value);
      preferences.setIsLoggedIn(true);

      Navigator.of(getContext()).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeApp()),
      );
      notifyListeners();
    });
  }

  void register(BuildContext Function() getContext) {
    Navigator.of(getContext()).push(
      MaterialPageRoute(builder: (context) => const RegisterApp()),
    );
    notifyListeners();
  }
}
