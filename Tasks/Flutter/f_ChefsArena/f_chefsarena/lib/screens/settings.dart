import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const CustomAppBar(text: 'Einstellungen'),
        extendBodyBehindAppBar: true,
        body: CustomBoxDeco(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('Dark Mode'),
                    trailing: Switch(value: false, onChanged: (_) {}),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Benachrichtigungen'),
                    trailing: Switch(value: false, onChanged: (_) {}),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.screen_lock_landscape),
                    title: const Text('Stay Awake Mode'),
                    trailing: Switch(value: false, onChanged: (_) {}),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.landscape_rounded),
                    title: const Text('Lock Landscape'),
                    trailing: Switch(value: false, onChanged: (_) {}),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Abmelden', style: TextStyle(color: AppTheme.cancel),),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
