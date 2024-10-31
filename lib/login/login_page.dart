import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../previewer.dart';
import 'login_notifier.dart';

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

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(),
      child: Consumer<LoginNotifier>(
        builder: (context, notifier, child) => LoginPage(
          onLoginButtonClicked: notifier.login,
          onRegisterButtonClicked: notifier.register,
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
      appBar: AppBar(title: const Text('로그인')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '이메일',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onLoginButtonClicked,
                    child: const Text('로그인'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: onRegisterButtonClicked,
                    child: const Text('회원가입'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
