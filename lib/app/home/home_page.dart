import 'package:aneukan/models/homecam.dart';
import 'package:aneukan/models/log.dart';
import 'package:aneukan/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_notifier.dart';
import 'log/log_view.dart';
import 'settings/settings_view.dart';
import 'package:aneukan/previewer.dart';
import 'package:aneukan/theme.dart';

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
            onLogTapped: notifier.onLogTapped,
            onDateRangeChanged: notifier.onDateRangeChanged,
            onHomecamTapped: notifier.onHomecamTapped,
            onDeleteHomecamTapped: notifier.onDeleteHomecamTapped,
            onAddHomecamTapped: notifier.onAddHomecamTapped,
            onCamBarClicked: notifier.onCamBarClicked,
          ),
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
  final void Function(Homecam) onDeleteHomecamTapped;
  final void Function() onAddHomecamTapped;
  final void Function(Homecam) onCamBarClicked;
  final void Function(Log) onLogTapped;
  final void Function(DateTimeRange?) onDateRangeChanged;

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
    required this.onDeleteHomecamTapped,
    required this.onAddHomecamTapped,
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
        selectedCam: widget.selectedCam,
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
        onDeleteHomecamTapped: widget.onDeleteHomecamTapped,
        onAddHomecamTapped: widget.onAddHomecamTapped,
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
        user: const User(
          name: '홍길동',
          email: 'hong@example.com',
          phone: '010-1234-5678',
        ),
        selectedCam: const Homecam(
          id: 1,
          name: '홈캠 1',
          telephone: '010-1234-5678',
          address: '서울시 강남구',
        ),
        homecams: const [
          Homecam(
              id: 1,
              name: '홈캠 1',
              telephone: '010-1234-5678',
              address: '서울시 강남구'),
          Homecam(
              id: 2,
              name: '홈캠 2',
              telephone: '010-1234-5678',
              address: '서울시 강남구'),
        ],
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
        onDeleteHomecamTapped: (homecam) {},
        onAddHomecamTapped: () {},
        onCamBarClicked: (homecam) {},
      ),
    ),
  );
}
