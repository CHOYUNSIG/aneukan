import 'package:flutter/material.dart';
import '../../previewer.dart';

void main() {
  runApp(
    Previewer(
      page: SettingsView(
        userName: '홍길동',
        userEmail: 'hong@example.com',
        isPushEnabled: true,
        isMessageEnabled: false,
        isEmailNotificationEnabled: true,
        onEditProfileTapped: () {},
        onPushNotificationChanged: (value) {},
        onMessageNotificationChanged: (value) {},
        onEmailNotificationChanged: (value) {},
      ),
    ),
  );
}

class SettingsView extends StatefulWidget {
  final String userName;
  final String userEmail;

  final bool isPushEnabled;
  final bool isMessageEnabled;
  final bool isEmailNotificationEnabled;

  final void Function() onEditProfileTapped;
  final void Function(bool) onPushNotificationChanged;
  final void Function(bool) onMessageNotificationChanged;
  final void Function(bool) onEmailNotificationChanged;

  const SettingsView({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.isPushEnabled,
    required this.isMessageEnabled,
    required this.isEmailNotificationEnabled,
    required this.onEditProfileTapped,
    required this.onPushNotificationChanged,
    required this.onMessageNotificationChanged,
    required this.onEmailNotificationChanged,
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
          // 사용자 정보 섹션
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(widget.userName),
              subtitle: Text(widget.userEmail),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: widget.onEditProfileTapped,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // 알림 설정 섹션
          const Text(
            '알림 설정',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // 알림 타입 1
          SwitchListTile(
            title: const Text('푸시 알림'),
            value: widget.isPushEnabled,
            onChanged: widget.onPushNotificationChanged,
          ),

          // 알림 타입 2
          SwitchListTile(
            title: const Text('문자 알림'),
            value: widget.isMessageEnabled,
            onChanged: widget.onMessageNotificationChanged,
          ),

          // 알림 타입 3
          SwitchListTile(
            title: const Text('이메일 알림'),
            value: widget.isEmailNotificationEnabled,
            onChanged: widget.onEmailNotificationChanged,
          ),
        ],
      ),
    );
  }
}
