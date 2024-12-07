import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:aneukan/data/repository/network/api_service.dart';

final getIt = GetIt.instance;

class RegisterNotifier extends ChangeNotifier {
  String id = '';
  String password = '';
  String passwordConfirm = '';
  String name = '';
  String phone = '';

  void setId(String id) {
    this.id = id;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  void setPasswordConfirm(String passwordConfirm) {
    this.passwordConfirm = passwordConfirm;
    notifyListeners();
  }

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setPhone(String phone) {
    this.phone = phone;
    notifyListeners();
  }

  void register(BuildContext Function() getContext) {
    getIt<ApiService>().register(id, password, name, phone).then((value) {
      Navigator.of(getContext()).pop();
      notifyListeners();
    });
  }

  void back(BuildContext Function() getContext) {
    Navigator.of(getContext()).pop();
    notifyListeners();
  }
}
