import 'package:flutter/material.dart';
import 'package:aneukan/models/homecam.dart';
import 'package:aneukan/home/settings/user_info_viewer.dart';
import 'package:aneukan/home/settings/notification_switch.dart';
import 'package:aneukan/home/settings/homecam_list.dart';
import 'package:aneukan/previewer.dart';

void main() {
  runApp(
    Previewer(
      page: SettingsView(
        userName: '홍길동',
        userEmail: 'hong@example.com',
        userPhone: '010-1234-5678',
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
        onHomecamTapped: (homecam) {},
        onDeleteHomecamTapped: (homecam) {},
        onAddHomecamTapped: () {},
      ),
    ),
  );
}

class SettingsView extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userPhone;

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

  const SettingsView({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
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
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfoViewer(
            userName: widget.userName,
            userEmail: widget.userEmail,
            userPhone: widget.userPhone,
            onEditProfileTapped: widget.onEditProfileTapped,
          ),
          const SizedBox(height: 24),
          NotificationSwitch(
            isPushNotificationEnabled: widget.isPushNotificationEnabled,
            isMessageNotificationEnabled: widget.isMessageNotificationEnabled,
            isEmailNotificationEnabled: widget.isEmailNotificationEnabled,
            onPushNotificationChanged: widget.onPushNotificationChanged,
            onMessageNotificationChanged: widget.onMessageNotificationChanged,
            onEmailNotificationChanged: widget.onEmailNotificationChanged,
          ),
          const SizedBox(height: 24),
          HomecamList(
            homecams: widget.homecams,
            onHomecamTapped: widget.onHomecamTapped,
            onDeleteHomecamTapped: widget.onDeleteHomecamTapped,
            onAddHomecamTapped: widget.onAddHomecamTapped,
          ),
        ],
      ),
    );
  }
}
