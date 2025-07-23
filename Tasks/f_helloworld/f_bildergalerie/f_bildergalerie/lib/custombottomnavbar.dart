import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.photo_library_outlined),
          label: 'Bilder',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Über mich',
        ),
      ],
      selectedItemColor: const Color.fromARGB(221, 255, 255, 255),
      unselectedItemColor: const Color.fromARGB(221, 255, 255, 255),
    );
  }
}
