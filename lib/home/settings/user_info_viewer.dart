import 'package:flutter/material.dart';

class UserInfoViewer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userPhone;

  final void Function() onEditProfileTapped;

  const UserInfoViewer({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.onEditProfileTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(userName),
        subtitle: Text('$userEmail\n$userPhone'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: onEditProfileTapped,
        ),
      ),
    );
  }
}
