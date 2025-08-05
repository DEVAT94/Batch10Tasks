import 'package:flutter/material.dart';

class CustomDarkTheme extends StatelessWidget {
  const CustomDarkTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: const Color.fromARGB(255, 74, 74, 74),
        ),
      ),
    );
  }
}