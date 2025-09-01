import 'package:flutter/material.dart';

class AppTheme {
  // Farben
  static const Color primaryColor = Color(0xFF8BC34A);
  static const Color secondaryColor = Colors.amber;
  static const Color cancel = Color.fromARGB(255, 203, 65, 109);
  static const Color headlineColor = Colors.white;
  static const Color textColor = Colors.black;
  static const Color regularCardColor = Color.fromARGB(150, 74, 74, 74);
  static const Color cardColor = Color.fromARGB(250, 74, 74, 74);

  // TextTheme
  static final TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: primaryColor),
    bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: cardColor),
    bodyMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: headlineColor),
    bodySmall: TextStyle(fontSize: 20, color: headlineColor),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: secondaryColor),
    labelMedium: TextStyle(fontSize: 14, color: headlineColor),
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

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonStyle,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: headlineColor,
        elevation: 0,
      ),
      cardColor: cardColor
    );
  }
}