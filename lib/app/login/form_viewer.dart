import 'package:flutter/material.dart';

class FormViewer extends StatelessWidget {
  final void Function() onLoginButtonClicked;
  final void Function() onRegisterButtonClicked;

  const FormViewer({
    super.key,
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
    );
  }
}
