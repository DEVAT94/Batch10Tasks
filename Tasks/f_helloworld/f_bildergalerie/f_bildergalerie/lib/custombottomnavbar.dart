import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_library_outlined),
          label: 'Bilder',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Über mich',
        ),
      ],
      selectedItemColor: Color.fromARGB(221, 255, 255, 255),
      unselectedItemColor: Color.fromARGB(221, 255, 255, 255),
    );
  }
}