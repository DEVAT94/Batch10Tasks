import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_chefsarena/data/userdata.dart';
import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/screens/Home/mainappscreen.dart';
import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  bool _isLoading = false;

  Future<void> _register() async {
    if (_passwordController.text != _repeatPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwörter stimmen nicht überein.")),
      );
      return;
    }

    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bitte alle Felder ausfüllen.")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final user = result.user;
      if (user != null) {
        // 🔹 UserData erstellen
        final newUser = UserData(
          uid: user.uid,
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          email: user.email ?? '',
          title: 'Hobbykoch', // Standardtitel
          rank: 1,
          xp: 0,
        );

        // 🔹 In Firestore speichern
        await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .set(newUser.toMap());
      }

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
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBoxDeco(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                Text('Registrieren', style: AppTheme.textTheme.bodyLarge),
                const SizedBox(height: 32),

                // 🔹 Vorname
                TextField(
                  controller: _firstNameController,
                  cursorColor: AppTheme.cardColor,
                  decoration: const InputDecoration(
                    labelText: 'Vorname',
                    labelStyle: TextStyle(color: AppTheme.cardColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 🔹 Nachname
                TextField(
                  controller: _lastNameController,
                  cursorColor: AppTheme.cardColor,
                  decoration: const InputDecoration(
                    labelText: 'Nachname',
                    labelStyle: TextStyle(color: AppTheme.cardColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 🔹 Email
                TextField(
                  controller: _emailController,
                  cursorColor: AppTheme.cardColor,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: AppTheme.cardColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 🔹 Passwort
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  cursorColor: AppTheme.cardColor,
                  decoration: const InputDecoration(
                    labelText: 'Passwort',
                    labelStyle: TextStyle(color: AppTheme.cardColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 🔹 Passwort wiederholen
                TextField(
                  obscureText: true,
                  controller: _repeatPasswordController,
                  cursorColor: AppTheme.cardColor,
                  decoration: const InputDecoration(
                    labelText: 'Passwort wiederholen',
                    labelStyle: TextStyle(color: AppTheme.cardColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.cardColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 🔹 Button
                _isLoading
                    ? const CircularProgressIndicator(color: AppTheme.cardColor)
                    : CustomElevatedButton(
                        onPressed: _register,
                        text: 'Registrieren',
                        width: 400,
                        icon: const Icon(
                          Icons.app_registration,
                          color: AppTheme.secondaryColor,
                        ),
                        backgroundColor: AppTheme.cardColor,
                        textStyle: AppTheme.textTheme.bodySmall,
                      ),

                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Zurück zum Login',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
