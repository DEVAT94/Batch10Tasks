import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/screens/LogIn/loginform.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: CustomBoxDeco(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 128),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(400),
                          child: Image.asset(
                            'assets/icons/chefsarena.png',
                            scale: 5,
                          ),
                        ),
                        const SizedBox(height: 64),
                        Text(
                          'Willkommen',
                          textAlign: TextAlign.center,
                          style: AppTheme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 32),
                        const LoginForm(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
