import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/screens/Home/mainappscreen.dart';
import 'package:f_chefsarena/screens/LogIn/register.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainAppScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login fehlgeschlagen: ${e.message}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            cursorColor: AppTheme.cardColor,
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: AppTheme.cardColor),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.cardColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.cardColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.cardColor, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.cardColor, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            obscureText: true,
            controller: _passwordController,
            cursorColor: AppTheme.cardColor,
            decoration: const InputDecoration(
              labelText: 'Passwort',
              labelStyle: TextStyle(color: AppTheme.cardColor),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.cardColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.cardColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.cardColor, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.cardColor, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomElevatedButton(
            width: 400,
            height: 50,
            onPressed: _login,
            text: 'Login',
            imageIcon: const ImageIcon(
              AssetImage('assets/icons/login.png'),
              color: Colors.amber,
            ),
            backgroundColor: AppTheme.cardColor,
            textStyle: AppTheme.textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Noch keinen Account? ',
                    style: TextStyle(
                      color: AppTheme.cardColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'Jetzt registrieren',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
