import 'package:f_chefsarena/screens/LogIn/authcontent.dart';
import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomBoxDeco(
          child: Center(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 128),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(400),
                    child: Image.asset('assets/icons/chefsarena.png', scale: 5),
                  ),
                  const SizedBox(height: 64),
                  Text(
                    'Willkommen',
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 32),
                  const AuthContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


