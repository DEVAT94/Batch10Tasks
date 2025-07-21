// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
          centerTitle: true,
          backgroundColor: Colors.lime,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text('Profile', style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),
              Icon(Icons.person, size: 60),
              Text(
                'Max Mustermann',
                style: TextStyle(fontSize: 20),
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
