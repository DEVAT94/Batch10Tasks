import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/screens/mainappscreen.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomBoxDeco(
          child: Center(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 200),
                  Text(
                    textAlign: TextAlign.center,
                    'Welcome',
                    style: AppTheme.textTheme.headlineLarge,
                  ),
                  Text(
                    'Sign In to continue',
                    style: AppTheme.textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8),
                  TextFields(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 32, right: 32),
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          CustomElevatedButton(
            onPressed: () {
              String username = _usernameController.text.trim();
              String password = _passwordController.text.trim();
              if (kDebugMode) {
                print("Username: $username Password: $password");
              }
              if (username == 'alex' && password == 'test') {
                if (kDebugMode) {
                  print("Username: $username Password: $password");
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainAppScreen(),
                  ),
                );
              } else {
                if (kDebugMode) {
                  print('Incorrect username or password');
                }
              }
            },
            text: 'Login',
            icon: ImageIcon(AssetImage('assets/icons/login.png')),
            backgroundColor: AppTheme.primaryColor,
            textStyle: AppTheme.textTheme.bodyMedium,
            iconColor: WidgetStatePropertyAll(AppTheme.regularCardColor),
            iconSize: WidgetStatePropertyAll(32),
          ),
        ],
      ),
    );
  }
}
