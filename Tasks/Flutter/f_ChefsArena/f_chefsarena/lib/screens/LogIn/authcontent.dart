import 'package:f_chefsarena/screens/LogIn/authform.dart';
import 'package:f_chefsarena/screens/LogIn/loginoptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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