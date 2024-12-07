import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aneukan/previewer.dart';
import 'login_notifier.dart';
import 'top_banner.dart';
import 'form_viewer.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(),
      child: Consumer<LoginNotifier>(
        builder: (context, notifier, child) => LoginPage(
          id: notifier.id,
          password: notifier.password,
          onIdChanged: (id) => notifier.setId(id),
          onPasswordChanged: (password) => notifier.setPassword(password),
          onLoginButtonClicked: () => notifier.login(() => context),
          onRegisterButtonClicked: () => notifier.register(() => context),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final String id;
  final String password;

  final void Function(String id) onIdChanged;
  final void Function(String password) onPasswordChanged;

  final void Function() onLoginButtonClicked;
  final void Function() onRegisterButtonClicked;

  const LoginPage({
    super.key,
    required this.id,
    required this.password,
    required this.onIdChanged,
    required this.onPasswordChanged,
    required this.onLoginButtonClicked,
    required this.onRegisterButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBanner(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.bottom) *
                0.4,
          ),
          FormViewer(
            id: id,
            password: password,
            onIdChanged: onIdChanged,
            onPasswordChanged: onPasswordChanged,
            onLoginButtonClicked: onLoginButtonClicked,
            onRegisterButtonClicked: onRegisterButtonClicked,
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
      page: LoginPage(
        id: '',
        password: '',
        onIdChanged: (id) {},
        onPasswordChanged: (password) {},
        onLoginButtonClicked: () {},
        onRegisterButtonClicked: () {},
      ),
    ),
  );
}
