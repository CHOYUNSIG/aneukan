import 'package:aneukan/data/models/homecam.dart';
import 'package:aneukan/data/models/log.dart';
import 'package:aneukan/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_notifier.dart';
import 'log/log_view.dart';
import 'settings/settings_view.dart';
import 'package:aneukan/previewer.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeNotifier(),
      child: Consumer<HomeNotifier>(
        builder: (context, notifier, child) => HomePage(
          logs: notifier.getLogs(),
          selectedDateRange: notifier.selectedDateRange,
          user: notifier.user,
          selectedCam: notifier.selectedCam,
          homecams: notifier.homecams,
          isPushNotificationEnabled: notifier.isPushNotificationEnabled,
          isMessageNotificationEnabled: notifier.isMessageNotificationEnabled,
          isEmailNotificationEnabled: notifier.isEmailNotificationEnabled,
          onEditProfileTapped: notifier.editProfile,
          onPushNotificationChanged: notifier.setPushNotification,
          onMessageNotificationChanged: notifier.setMessageNotification,
          onEmailNotificationChanged: notifier.setEmailNotification,
          onLogTapped: (log) => notifier.onLogTapped(log, () => context),
          onDateRangeChanged: notifier.onDateRangeChanged,
          onHomecamTapped: notifier.onHomecamTapped,
          onCamBarClicked: () => notifier.onCamBarClicked(() => context),
          onAddHomecamTapped: () => notifier.onAddHomecamTapped(() => context),
          onLogoutTapped: () => notifier.logout(() => context),
          onCamResetButtonClicked: () =>
              notifier.onSelectedHomecamChanged(null),
          onDateResetButtonClicked: () => notifier.onDateRangeChanged(null),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Log> logs;
  final DateTimeRange? selectedDateRange;
  final User? user;
  final Homecam? selectedCam;
  final List<Homecam> homecams;
  final bool isPushNotificationEnabled;
  final bool isMessageNotificationEnabled;
  final bool isEmailNotificationEnabled;

  final void Function() onEditProfileTapped;
  final void Function(bool) onPushNotificationChanged;
  final void Function(bool) onMessageNotificationChanged;
  final void Function(bool) onEmailNotificationChanged;
  final void Function(Homecam) onHomecamTapped;
  final void Function() onAddHomecamTapped;
  final void Function() onCamBarClicked;
  final void Function(Log) onLogTapped;
  final void Function(DateTimeRange?) onDateRangeChanged;
  final void Function() onLogoutTapped;
  final void Function() onCamResetButtonClicked;
  final void Function() onDateResetButtonClicked;

  const HomePage({
    super.key,
    required this.logs,
    required this.selectedCam,
    required this.selectedDateRange,
    required this.onCamBarClicked,
    required this.onLogTapped,
    required this.onDateRangeChanged,
    required this.user,
    required this.homecams,
    required this.isPushNotificationEnabled,
    required this.isMessageNotificationEnabled,
    required this.isEmailNotificationEnabled,
    required this.onEditProfileTapped,
    required this.onPushNotificationChanged,
    required this.onMessageNotificationChanged,
    required this.onEmailNotificationChanged,
    required this.onHomecamTapped,
    required this.onAddHomecamTapped,
    required this.onLogoutTapped,
    required this.onCamResetButtonClicked,
    required this.onDateResetButtonClicked,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
      ),
      body: switch (_navBarIndex) {
        0 => LogView(
            logs: widget.logs,
            selectedCam: widget.selectedCam,
            selectedDateRange: widget.selectedDateRange,
            onLogTapped: widget.onLogTapped,
            onDateRangeChanged: widget.onDateRangeChanged,
            onCamBarClicked: widget.onCamBarClicked,
            onCamResetButtonClicked: widget.onCamResetButtonClicked,
            onDateResetButtonClicked: widget.onDateResetButtonClicked,
          ),
        1 => SettingsView(
            user: widget.user,
            homecams: widget.homecams,
            isPushNotificationEnabled: widget.isPushNotificationEnabled,
            isMessageNotificationEnabled: widget.isMessageNotificationEnabled,
            isEmailNotificationEnabled: widget.isEmailNotificationEnabled,
            onEditProfileTapped: widget.onEditProfileTapped,
            onPushNotificationChanged: widget.onPushNotificationChanged,
            onMessageNotificationChanged: widget.onMessageNotificationChanged,
            onEmailNotificationChanged: widget.onEmailNotificationChanged,
            onHomecamTapped: widget.onHomecamTapped,
            onAddHomecamTapped: widget.onAddHomecamTapped,
            onLogoutTapped: widget.onLogoutTapped,
          ),
        _ => const SizedBox(),
      },
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1,
            indent: 32,
            endIndent: 32,
            color: Colors.black26,
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: '기록',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '설정',
              ),
            ],
            currentIndex: _navBarIndex,
            onTap: (index) => setState(() => _navBarIndex = index),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    Previewer(
      isView: false,
      page: HomePage(
        logs: [log1, log2, log3],
        selectedDateRange: DateTimeRange(
          start: DateTime.now().subtract(const Duration(days: 2)),
          end: DateTime.now(),
        ),
        user: user1,
        selectedCam: homecam1,
        homecams: const [homecam1, homecam2],
        isPushNotificationEnabled: true,
        isMessageNotificationEnabled: false,
        isEmailNotificationEnabled: true,
        onEditProfileTapped: () {},
        onPushNotificationChanged: (value) {},
        onMessageNotificationChanged: (value) {},
        onEmailNotificationChanged: (value) {},
        onLogTapped: (log) {},
        onDateRangeChanged: (dateRange) {},
        onHomecamTapped: (homecam) {},
        onAddHomecamTapped: () {},
        onCamBarClicked: () {},
        onLogoutTapped: () {},
        onCamResetButtonClicked: () {},
        onDateResetButtonClicked: () {},
      ),
    ),
  );
}
