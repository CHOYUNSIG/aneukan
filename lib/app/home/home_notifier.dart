import 'package:flutter/material.dart';
import 'package:aneukan/data/models/log.dart';
import 'package:aneukan/data/models/homecam.dart';
import 'package:aneukan/data/models/user.dart';

class HomeNotifier extends ChangeNotifier {
  List<Log> logs = [];
  DateTimeRange? selectedDateRange;

  User? user;

  Homecam? selectedCam;

  List<Homecam> homecams = [];

  bool isPushNotificationEnabled = false;
  bool isMessageNotificationEnabled = false;
  bool isEmailNotificationEnabled = false;

  void editProfile() {
    // TODO: 프로필 수정 로직 구현
    notifyListeners();
  }

  void setPushNotification(bool value) {
    isPushNotificationEnabled = value;
    notifyListeners();
  }

  void setMessageNotification(bool value) {
    isMessageNotificationEnabled = value;
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

  void onHomecamTapped(Homecam homecam) {
    // TODO: 홈캠 탭 로직 구현
    notifyListeners();
  }

  void onDeleteHomecamTapped(Homecam homecam) {
    // TODO: 홈캠 삭제 로직 구현
    notifyListeners();
  }

  void onAddHomecamTapped() {
    // TODO: 홈캠 추가 로직 구현
    notifyListeners();
  }

  void onCamBarClicked(Homecam homecam) {
    selectedCam = homecam;
    notifyListeners();
  }

  void logout() {
    // TODO: 로그아웃 로직 구현
    notifyListeners();
  }
}
