import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('News', style: TextStyle(fontSize: 40)),
              Icon(Icons.newspaper, size: 60),
            ],
          ),
        ),
      ),
    );
  }
}
