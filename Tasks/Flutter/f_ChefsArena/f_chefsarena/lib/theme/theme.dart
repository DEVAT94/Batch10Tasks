import 'package:flutter/material.dart';

class AppTheme {
  // Farben
  static const Color primaryColor = Color(0xFF8BC34A);
  static const Color secondaryColor = Colors.amber;
  static const Color headlineColor = Colors.white;
  static const Color textColor = Colors.black;

  // TextTheme
  static final TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: headlineColor),
    bodyMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: headlineColor),
    labelLarge: TextStyle(fontSize: 14, color: textColor),
  );

  // ButtonStyle
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: textColor,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  // Komplettes ThemeData
  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonStyle,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: headlineColor,
        elevation: 0,
      ),
    );
  }
}