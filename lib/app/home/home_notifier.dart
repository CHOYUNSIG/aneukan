import 'package:flutter/material.dart';
import 'package:aneukan/data/models/log.dart';
import 'package:aneukan/data/models/homecam.dart';
import 'package:aneukan/data/models/user.dart';
import 'package:aneukan/app/login/login_page.dart';
import 'package:aneukan/app/home/dialog/homecam_addition_dialog.dart';
import 'package:aneukan/app/home/dialog/homecam_selection_dialog.dart';
import 'package:aneukan/data/repository/network/api_service.dart';
import 'package:aneukan/data/repository/local/local_preferences.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class HomeNotifier extends ChangeNotifier {
  User? user;
  List<Homecam> homecams = [];

  List<Log> logs = [];
  DateTimeRange? selectedDateRange;
  Homecam? selectedCam;

  bool isPushNotificationEnabled = false;
  bool isMessageNotificationEnabled = true;
  bool isEmailNotificationEnabled = false;

  HomeNotifier() {
    final preferences = getIt<LocalPreferences>();
    final api = getIt<ApiService>();
    final key = preferences.getUserKey();

    api.getHomecamList(key).then((value) {
      homecams = value;
      notifyListeners();

      for (final homecam in homecams) {
        try {
          api.getLogList(homecam.id).then((value) {
            logs.addAll(value);
            notifyListeners();
          });
        } catch (e) {
          // TODO: 로그 로딩 실패 처리
        }
      }
    });

    api.getMyInfo(key).then((value) {
      user = value;
      notifyListeners();
    });
  }

  void editProfile() {
    // TODO: 프로필 수정 로직 구현
    notifyListeners();
  }

  void setPushNotification(bool value) {
    // isPushNotificationEnabled = value;
    notifyListeners();
  }

  void setMessageNotification(bool value) {
    // isMessageNotificationEnabled = value;
    notifyListeners();
  }

  void setEmailNotification(bool value) {
    // isEmailNotificationEnabled = value;
    notifyListeners();
  }

  void onLogTapped(Log log) {
    // TODO: 로그 탭 로직 구현
    notifyListeners();
  }

  void onSelectedHomecamChanged(Homecam? homecam) {
    selectedCam = homecam;
    notifyListeners();
  }

  void onDateRangeChanged(DateTimeRange? dateRange) {
    selectedDateRange = dateRange;
    notifyListeners();
  }

  void onHomecamTapped(Homecam homecam) {
    // TODO: 홈캠 선택 로직 구현
    notifyListeners();
  }

  void onAddHomecamTapped(BuildContext Function() getContext) {
    showDialog(
      context: getContext(),
      builder: (context) => HomecamAdditionDialog(
        onAddButtonClicked: (serialNumber, onError) {
          final preferences = getIt<LocalPreferences>();
          final api = getIt<ApiService>();
          final key = preferences.getUserKey();

          api
              .postHomecamAccessPermissionRequest(key, serialNumber)
              .catchError((error) => onError())
              .then((_) {
            Navigator.of(getContext()).pop();
            api.getHomecamList(key).then((value) {
              homecams = value;
              notifyListeners();
            });
          });
        },
        onCancelButtonClicked: () => Navigator.of(context).pop(),
      ),
    );
    notifyListeners();
  }

  void onCamBarClicked(BuildContext Function() getContext) {
    showDialog(
      context: getContext(),
      builder: (context) => HomecamSelectionDialog(
        homecams: homecams,
        onHomecamTapped: (homecam) {
          selectedCam = homecam;
          Navigator.of(context).pop();
          notifyListeners();
        },
        onCancelButtonClicked: () => Navigator.of(context).pop(),
      ),
    );
    notifyListeners();
  }

  void logout(BuildContext Function() getContext) {
    final preferences = getIt<LocalPreferences>();
    preferences.setUserKey(0);
    preferences.setIsLoggedIn(false);

    Navigator.of(getContext()).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginApp()),
    );
    notifyListeners();
  }
}
