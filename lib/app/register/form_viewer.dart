import 'package:flutter/material.dart';

class FormViewer extends StatelessWidget {
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

  const FormViewer({
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '회원가입',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '이름',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '이름을 입력해주세요';
              }
              return null;
            },
            onChanged: onNameChanged,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '전화번호',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '전화번호를 입력해주세요';
              }
              return null;
            },
            onChanged: onPhoneChanged,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '아이디',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '사용할 아이디를 입력해주세요';
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
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '비밀번호 확인',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '비밀번호를 다시 입력해주세요';
              }
              return null;
            },
            onChanged: onPasswordConfirmChanged,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onBackButtonClicked,
                child: const Text('뒤로가기'),
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
