import 'package:flutter/material.dart';
import 'package:aneukan/data/models/homecam.dart';
import 'package:aneukan/app/home/settings/user_info_viewer.dart';
import 'package:aneukan/app/home/settings/notification_switch.dart';
import 'package:aneukan/app/home/settings/homecam_list.dart';
import 'package:aneukan/data/models/user.dart';
import 'package:aneukan/previewer.dart';

class SettingsView extends StatefulWidget {
  final User? user;
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
  final void Function() onLogoutTapped;

  const SettingsView({
    super.key,
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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.user != null)
            UserInfoViewer(
              user: widget.user!,
              onEditProfileTapped: widget.onEditProfileTapped,
              onLogoutTapped: widget.onLogoutTapped,
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
            onAddHomecamTapped: widget.onAddHomecamTapped,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    Previewer(
      page: SettingsView(
        user: user1,
        homecams: const [homecam1, homecam2],
        isPushNotificationEnabled: true,
        isMessageNotificationEnabled: false,
        isEmailNotificationEnabled: true,
        onEditProfileTapped: () {},
        onPushNotificationChanged: (value) {},
        onMessageNotificationChanged: (value) {},
        onEmailNotificationChanged: (value) {},
        onHomecamTapped: (homecam) {},
        onAddHomecamTapped: () {},
        onLogoutTapped: () {},
      ),
    ),
  );
}
