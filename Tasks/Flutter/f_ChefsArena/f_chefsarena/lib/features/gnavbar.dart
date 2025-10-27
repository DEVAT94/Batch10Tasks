import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBarItems extends StatelessWidget {
  const BottomNavBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      backgroundColor: const Color.fromARGB(255, 74, 74, 74),
      tabs: const [
        GButton(
          icon: Icons.add_home,
          iconColor: Colors.white,
          iconActiveColor: Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Home',
          style: GnavStyle.oldSchool,
        ),
        GButton(
          icon: Icons.cookie,
          iconColor: Colors.white,
          iconActiveColor: Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Duell',
        ),
        GButton(
          icon: Icons.receipt_long_rounded,
          iconColor: Colors.white,
          iconActiveColor: Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Rezepte',
        ),
        GButton(
          icon: Icons.group,
          iconColor: Colors.white,
          iconActiveColor: Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Freunde',
        ),
        GButton(
          icon: Icons.settings,
          iconColor: Colors.white,
          iconActiveColor: Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Einstellungen',
        ),
      ],
    );
  }
}
