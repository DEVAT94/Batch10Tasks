import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu)
          )],
          title: Text('Test', style: TextStyle(color: Colors.white)),
        ),
        body: Center(child: Text('Hello World!')),
      ),
    );
  }
}
