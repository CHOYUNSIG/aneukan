import 'package:aneukan/data/repository/local/local_preferences.dart';
import 'package:flutter/material.dart';
import 'package:aneukan/app/login/login_page.dart';
import 'package:aneukan/di/setup_locator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aneukan/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:aneukan/app/home/home_page.dart';

final getIt = GetIt.instance;

void main() async {
  await dotenv.load();
  await setupLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn = getIt<LocalPreferences>().getIsLoggedIn();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AneukanTheme.theme,
      home: isLoggedIn ? const HomeApp() : const LoginApp(),
    );
  }
}
