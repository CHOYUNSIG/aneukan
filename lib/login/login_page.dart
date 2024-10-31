import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aneukan/previewer.dart';
import 'package:aneukan/theme.dart';
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
      body: Center(
        child: Column(
          children: [
            Container(
              color: brandColor,
              height: max(MediaQuery.of(context).size.height * 0.4, 360),
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '아늑한',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      ': 인공지능 홈캠 낙상 감지 서비스',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '로그인',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
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
            )
          ],
        ),
      ),
    );
  }
}
