import 'package:flutter/material.dart';
import 'package:aneukan/log.dart';

class HomeNotifier extends ChangeNotifier {
  List<Log> logs = [];
  DateTimeRange? selectedDateRange;

  String userName = '';
  String userEmail = '';
  bool isPushEnabled = false;
  bool isMessageEnabled = false;
  bool isEmailNotificationEnabled = false;

  void editProfile() {
    // TODO: 프로필 수정 로직 구현
    notifyListeners();
  }

  void setPushNotification(bool value) {
    isPushEnabled = value;
    notifyListeners();
  }

  void setMessageNotification(bool value) {
    isMessageEnabled = value;
    notifyListeners();
  }

  void setEmailNotification(bool value) {
    isEmailNotificationEnabled = value;
    notifyListeners();
  }

  void onLogTapped(Log log) {
    // TODO: 로그 탭 로직 구현
    notifyListeners();
  }

  void onDateRangeChanged(DateTimeRange? dateRange) {
    selectedDateRange = dateRange;
    notifyListeners();
  }

  void logout() {
    // TODO: 로그아웃 로직 구현
    notifyListeners();
  }
}
