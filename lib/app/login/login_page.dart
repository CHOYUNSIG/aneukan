import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aneukan/previewer.dart';
import 'package:aneukan/theme.dart';
import 'login_notifier.dart';
import 'top_banner.dart';
import 'form_viewer.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(),
      child: MaterialApp(
        theme: AneukanTheme.theme,
        home: Consumer<LoginNotifier>(
          builder: (context, notifier, child) => LoginPage(
            onLoginButtonClicked: notifier.login,
            onRegisterButtonClicked: notifier.register,
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final void Function() onLoginButtonClicked;
  final void Function() onRegisterButtonClicked;

  const LoginPage({
    super.key,
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
        onLoginButtonClicked: () {},
        onRegisterButtonClicked: () {},
      ),
    ),
  );
}
