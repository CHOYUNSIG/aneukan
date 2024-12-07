import 'package:flutter/material.dart';

class FormViewer extends StatelessWidget {
  final String id;
  final String password;

  final void Function(String id) onIdChanged;
  final void Function(String password) onPasswordChanged;

  final void Function() onLoginButtonClicked;
  final void Function() onRegisterButtonClicked;

  const FormViewer({
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
    return Padding(
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
              labelText: '아이디',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '아이디를 입력해주세요';
              }
              return null;
            },
            onChanged: onIdChanged,
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
            onChanged: onPasswordChanged,
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
    );
  }
}
