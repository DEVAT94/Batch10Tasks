import 'package:f_bildergalerie/mygallery.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: true,
          title: Text('My Gallery'),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: MyGallery(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.photo_library_outlined), label: 'Bilder',),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Über mich')
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
