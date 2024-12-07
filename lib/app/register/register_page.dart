import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aneukan/previewer.dart';
import 'register_notifier.dart';
import 'form_viewer.dart';
import 'top_banner.dart';

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterNotifier(),
      child: Consumer<RegisterNotifier>(
        builder: (context, notifier, child) => RegisterPage(
          id: notifier.id,
          password: notifier.password,
          passwordConfirm: notifier.passwordConfirm,
          name: notifier.name,
          phone: notifier.phone,
          onIdChanged: (id) => notifier.setId(id),
          onPasswordChanged: (password) => notifier.setPassword(password),
          onPasswordConfirmChanged: (passwordConfirm) =>
              notifier.setPasswordConfirm(passwordConfirm),
          onNameChanged: (name) => notifier.setName(name),
          onPhoneChanged: (phone) => notifier.setPhone(phone),
          onBackButtonClicked: () => notifier.back(() => context),
          onRegisterButtonClicked: () => notifier.register(() => context),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  final String id;
  final String password;
  final String passwordConfirm;
  final String name;
  final String phone;

  final void Function(String id) onIdChanged;
  final void Function(String password) onPasswordChanged;
  final void Function(String passwordConfirm) onPasswordConfirmChanged;
  final void Function(String name) onNameChanged;
  final void Function(String phone) onPhoneChanged;

  final void Function() onBackButtonClicked;
  final void Function() onRegisterButtonClicked;

  const RegisterPage({
    super.key,
    required this.id,
    required this.password,
    required this.passwordConfirm,
    required this.name,
    required this.phone,
    required this.onIdChanged,
    required this.onPasswordChanged,
    required this.onPasswordConfirmChanged,
    required this.onNameChanged,
    required this.onPhoneChanged,
    required this.onBackButtonClicked,
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
                0.2,
          ),
          FormViewer(
            id: id,
            password: password,
            passwordConfirm: passwordConfirm,
            name: name,
            phone: phone,
            onIdChanged: onIdChanged,
            onPasswordChanged: onPasswordChanged,
            onPasswordConfirmChanged: onPasswordConfirmChanged,
            onNameChanged: onNameChanged,
            onPhoneChanged: onPhoneChanged,
            onBackButtonClicked: onBackButtonClicked,
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
      page: RegisterPage(
        id: '',
        password: '',
        passwordConfirm: '',
        name: '',
        phone: '',
        onIdChanged: (id) {},
        onPasswordChanged: (password) {},
        onPasswordConfirmChanged: (passwordConfirm) {},
        onNameChanged: (name) {},
        onPhoneChanged: (phone) {},
        onBackButtonClicked: () {},
        onRegisterButtonClicked: () {},
      ),
    ),
  );
}
