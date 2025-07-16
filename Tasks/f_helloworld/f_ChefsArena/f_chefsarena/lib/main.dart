import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 74, 74, 74),
          centerTitle: true,
          title: Text(
            'Home',
            style: TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.blueGrey,
              width: 50,
              child: Card(color: Colors.blueGrey),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add_home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.cookie), label: 'Duell'),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_rounded),
              label: 'Rezepte',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Freunde'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
