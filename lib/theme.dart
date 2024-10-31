import 'package:flutter/material.dart';

const Color brandColor = Color.fromARGB(255, 255, 152, 0);

class AneukanTheme {
  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
          seedColor: brandColor,
        ),
        appBarTheme: AppBarTheme(
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.5),
          surfaceTintColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: brandColor,
          selectedIconTheme: IconThemeData(
            shadows: [
              Shadow(blurRadius: 10, color: brandColor.withOpacity(0.5))
            ],
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
        ),
      );
}
