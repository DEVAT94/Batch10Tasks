import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/screens/Home/mainappscreen.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                  // ignore: use_build_context_synchronously
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