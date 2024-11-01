import 'package:flutter/material.dart';

class NotificationSwitch extends StatelessWidget {
  final bool isPushNotificationEnabled;
  final bool isMessageNotificationEnabled;
  final bool isEmailNotificationEnabled;

  final void Function(bool) onPushNotificationChanged;
  final void Function(bool) onMessageNotificationChanged;
  final void Function(bool) onEmailNotificationChanged;

  const NotificationSwitch({
    super.key,
    required this.isPushNotificationEnabled,
    required this.isMessageNotificationEnabled,
    required this.isEmailNotificationEnabled,
    required this.onPushNotificationChanged,
    required this.onMessageNotificationChanged,
    required this.onEmailNotificationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              '알림 설정',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // 알림 타입 1
        SwitchListTile(
          title: const Text('푸시 알림'),
          value: isPushNotificationEnabled,
          onChanged: onPushNotificationChanged,
        ),

        // 알림 타입 2
        SwitchListTile(
          title: const Text('문자 알림'),
          value: isMessageNotificationEnabled,
          onChanged: onMessageNotificationChanged,
        ),

        // 알림 타입 3
        SwitchListTile(
          title: const Text('이메일 알림'),
          value: isEmailNotificationEnabled,
          onChanged: onEmailNotificationChanged,
        ),
      ],
    );
  }
}
