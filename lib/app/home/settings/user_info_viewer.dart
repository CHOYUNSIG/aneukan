import 'package:flutter/material.dart';
import 'package:aneukan/data/models/user.dart';

class UserInfoViewer extends StatelessWidget {
  final User user;
  final void Function() onEditProfileTapped;
  final void Function() onLogoutTapped;

  const UserInfoViewer({
    super.key,
    required this.user,
    required this.onEditProfileTapped,
    required this.onLogoutTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            onTap: onEditProfileTapped,
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(user.name),
            subtitle: Text('${user.userId}\n${user.phone}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEditProfileTapped,
            ),
          ),
        ),
        TextButton(
          onPressed: onLogoutTapped,
          child: const Text('로그아웃'),
        ),
      ],
    );
  }
}
