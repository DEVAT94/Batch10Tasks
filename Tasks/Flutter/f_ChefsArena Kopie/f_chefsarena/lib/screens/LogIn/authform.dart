import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/screens/Home/mainappscreen.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
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
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login fehlgeschlagen: ${e.message}")),
      );
    }
  }

  Future<void> _register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
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
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registrierung fehlgeschlagen: ${e.message}")),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              labelText: 'Password',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                iconColor: WidgetStatePropertyAll(AppTheme.regularCardColor),
                iconSize: const WidgetStatePropertyAll(32),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 32),
                  Center(
                    child: TextButton(
                      onPressed: _register,
                      child: RichText(
                        text: TextSpan(
                          text: 'Noch keinen Account? ',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
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
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
