import 'package:flutter/material.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({super.key});

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
              Text('Likes', style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),
              Text(
                'Hier findest du deine gelikten Nachrichten.',
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
