import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/screens/Home/mainappscreen.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                  const SizedBox(height: 200),
                  Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.headlineLarge,
                  ),
                  Text(
                    'Sign in or register to continue',
                    style: AppTheme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
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

class AuthContent extends StatelessWidget {
  const AuthContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          return LoggedInOptions(email: snapshot.data!.email ?? "User");
        }

        return const AuthForm();
      },
    );
  }
}

class LoggedInOptions extends StatelessWidget {
  final String email;
  const LoggedInOptions({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Angemeldet als: $email", style: AppTheme.textTheme.bodyMedium),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainAppScreen(),
                    ),
                  );
                },
                text: 'Weiter',
                icon: Icon(Icons.navigate_next),
                backgroundColor: AppTheme.primaryColor,
                textStyle: AppTheme.textTheme.bodyMedium,
                iconColor: WidgetStatePropertyAll(AppTheme.regularCardColor),
                iconSize: const WidgetStatePropertyAll(32),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Erfolgreich ausgeloggt")),
                  );
                },
                text: 'Logout',
                icon: Icon(Icons.logout_sharp),
                backgroundColor: AppTheme.primaryColor,
                textStyle: AppTheme.textTheme.bodyMedium,
                iconColor: WidgetStatePropertyAll(AppTheme.regularCardColor),
                iconSize: const WidgetStatePropertyAll(32),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                width: 160,
                height: 40,
                onPressed: _login,
                text: 'Login',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/login.png'),
                ),
                backgroundColor: AppTheme.primaryColor,
                textStyle: AppTheme.textTheme.bodyMedium,
                iconColor: WidgetStatePropertyAll(AppTheme.regularCardColor),
                iconSize: const WidgetStatePropertyAll(32),
              ),
              CustomElevatedButton(
                width: 180,
                height: 40,
                onPressed: _register,
                text: 'Register',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/login.png'),
                ),
                backgroundColor: AppTheme.primaryColor,
                textStyle: AppTheme.textTheme.bodyMedium,
                iconColor: WidgetStatePropertyAll(AppTheme.regularCardColor),
                iconSize: const WidgetStatePropertyAll(32),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
