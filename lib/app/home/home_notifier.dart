import 'package:flutter/material.dart';
import 'package:aneukan/data/models/log.dart';
import 'package:aneukan/data/models/homecam.dart';
import 'package:aneukan/data/models/user.dart';
import 'package:aneukan/app/login/login_page.dart';
import 'package:aneukan/data/models/access_info.dart';
import 'package:aneukan/app/home/dialog/homecam_addition_dialog.dart';
import 'package:aneukan/app/home/dialog/homecam_selection_dialog.dart';
import 'package:aneukan/app/home/dialog/video_player_dialog.dart';
import 'package:aneukan/data/repository/network/api_service.dart';
import 'package:aneukan/data/repository/local/local_preferences.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class HomeNotifier extends ChangeNotifier {
  User? user;
  List<Homecam> homecams = [];
  List<AccessInfo> accessInfos = [];
  List<Log> logs = [];

  DateTimeRange? selectedDateRange;
  Homecam? selectedCam;

  bool isPushNotificationEnabled = false;
  bool isMessageNotificationEnabled = true;
  bool isEmailNotificationEnabled = false;

  HomeNotifier() {
    refresh();
  }

  Future<void> refresh() async {
    user = null;
    homecams = [];
    accessInfos = [];
    logs = [];
    notifyListeners();

    final preferences = getIt<LocalPreferences>();
    final api = getIt<ApiService>();
    final key = preferences.getUserKey();

    api.getHomecamAccessList(key).then((accessInfos) {
      this.accessInfos = accessInfos;
      notifyListeners();

      for (final accessInfo in accessInfos) {
        if (accessInfo.isAccessable) {
          try {
            api
                .getHomecamIdFromSerialNumber(accessInfo.homecamSerialNumber)
                .then((id) {
              api.getLogList(id).then((value) {
                logs = value.toList()
                  ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
                notifyListeners();
              });
            });
          } catch (e) {
            // TODO: 로그 로딩 실패 처리
          }

          try {
            api
                .getHomecamDetail(accessInfo.homecamSerialNumber)
                .then((homecam) {
              homecams.add(homecam);
              notifyListeners();
            });
          } catch (e) {
            // TODO: 홈캠 로딩 실패 처리
          }
        }
      }
    });

    api.getMyInfo(key).then((value) {
      user = value;
      notifyListeners();
    });
  }

  List<Log> getLogs() {
    final homecamId = selectedCam?.id;
    final dateRange = selectedDateRange;

    return logs
        .where((log) =>
            (homecamId == null || log.homecamId == homecamId) &&
            (dateRange == null ||
                (dateRange.start.isBefore(log.timestamp) &&
                    dateRange.end
                        .add(const Duration(days: 1))
                        .isAfter(log.timestamp))))
        .toList();
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

  void onLogTapped(Log log, BuildContext Function() getContext) {
    showDialog(
      context: getContext(),
      builder: (context) => VideoPlayerDialog(videoId: log.id),
    );
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

  void onHomecamTapped(AccessInfo accessInfo) {
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
            api.getHomecamAccessList(key).then((value) {
              accessInfos = value;
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
