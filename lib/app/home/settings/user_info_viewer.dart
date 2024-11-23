import 'package:flutter/material.dart';
import 'package:aneukan/data/models/user.dart';

class UserInfoViewer extends StatelessWidget {
  final User user;
  final void Function() onEditProfileTapped;

  const UserInfoViewer({
    super.key,
    required this.user,
    required this.onEditProfileTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(user.name),
        subtitle: Text('${user.email}\n${user.phone}'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: onEditProfileTapped,
        ),
      ),
    );
  }
}
