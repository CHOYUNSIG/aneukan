import 'package:aneukan/models/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_notifier.dart';
import 'log/log_view.dart';
import 'settings/settings_view.dart';
import 'package:aneukan/previewer.dart';
import 'package:aneukan/theme.dart';

void main() {
  runApp(
    Previewer(
      isView: false,
      page: HomePage(
        logs: [
          Log(id: 1, timestamp: DateTime.parse('2024-01-01T16:03:20')),
          Log(id: 2, timestamp: DateTime.parse('2024-03-02T21:16:05')),
          Log(id: 3, timestamp: DateTime.parse('2024-06-13T08:42:15')),
        ],
        selectedDateRange: null,
        userName: '홍길동',
        userEmail: 'hong@example.com',
        isPushEnabled: true,
        isMessageEnabled: false,
        isEmailNotificationEnabled: true,
        onEditProfileTapped: () {},
        onPushNotificationChanged: (value) {},
        onMessageNotificationChanged: (value) {},
        onEmailNotificationChanged: (value) {},
        onLogTapped: (log) {},
        onDateRangeChanged: (dateRange) {},
      ),
    ),
  );
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeNotifier(),
      child: MaterialApp(
        theme: AneukanTheme.theme,
        home: Consumer<HomeNotifier>(
          builder: (context, notifier, child) => HomePage(
            logs: notifier.logs,
            selectedDateRange: notifier.selectedDateRange,
            userName: notifier.userName,
            userEmail: notifier.userEmail,
            isPushEnabled: notifier.isPushEnabled,
            isMessageEnabled: notifier.isMessageEnabled,
            isEmailNotificationEnabled: notifier.isEmailNotificationEnabled,
            onEditProfileTapped: notifier.editProfile,
            onPushNotificationChanged: notifier.setPushNotification,
            onMessageNotificationChanged: notifier.setMessageNotification,
            onEmailNotificationChanged: notifier.setEmailNotification,
            onLogTapped: notifier.onLogTapped,
            onDateRangeChanged: notifier.onDateRangeChanged,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Log> logs;
  final DateTimeRange? selectedDateRange;

  final String userName;
  final String userEmail;

  final bool isPushEnabled;
  final bool isMessageEnabled;
  final bool isEmailNotificationEnabled;

  final void Function(Log) onLogTapped;
  final void Function(DateTimeRange?) onDateRangeChanged;

  final void Function() onEditProfileTapped;
  final void Function(bool) onPushNotificationChanged;
  final void Function(bool) onMessageNotificationChanged;
  final void Function(bool) onEmailNotificationChanged;

  const HomePage({
    super.key,
    required this.logs,
    required this.selectedDateRange,
    required this.userName,
    required this.userEmail,
    required this.isPushEnabled,
    required this.isMessageEnabled,
    required this.isEmailNotificationEnabled,
    required this.onEditProfileTapped,
    required this.onPushNotificationChanged,
    required this.onMessageNotificationChanged,
    required this.onEmailNotificationChanged,
    required this.onLogTapped,
    required this.onDateRangeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget? _page;

  void _navigateToLogView() {
    setState(() {
      _page = LogView(
        logs: widget.logs,
        selectedCam: null,
        selectedDateRange: widget.selectedDateRange,
        onLogTapped: widget.onLogTapped,
        onDateRangeChanged: widget.onDateRangeChanged,
        onCamBarClicked: (cam) {},
      );
    });
  }

  void _navigateToSettingsView() {
    setState(() {
      _page = SettingsView(
        userName: widget.userName,
        userEmail: widget.userEmail,
        isPushEnabled: widget.isPushEnabled,
        isMessageEnabled: widget.isMessageEnabled,
        isEmailNotificationEnabled: widget.isEmailNotificationEnabled,
        onEditProfileTapped: widget.onEditProfileTapped,
        onPushNotificationChanged: widget.onPushNotificationChanged,
        onMessageNotificationChanged: widget.onMessageNotificationChanged,
        onEmailNotificationChanged: widget.onEmailNotificationChanged,
      );
    });
  }

  void _onNavBarItemClicked(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _navigateToLogView();
        case 1:
          _navigateToSettingsView();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _navigateToLogView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
      ),
      body: _page,
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
            currentIndex: _selectedIndex,
            onTap: _onNavBarItemClicked,
          ),
        ],
      ),
    );
  }
}
