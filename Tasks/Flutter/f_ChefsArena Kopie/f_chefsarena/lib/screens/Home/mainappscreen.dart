import 'package:f_chefsarena/screens/Recipes/addrecipes.dart';
import 'package:f_chefsarena/screens/duel/duel.dart';
import 'package:f_chefsarena/screens/Friends/friends.dart';
import 'package:f_chefsarena/screens/Home/home.dart';
import 'package:f_chefsarena/screens/Recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    DuelMode(),
    RecipeScreen(),
    FriendScreen(),
    AddRecipes()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 74, 74, 74),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: const Color.fromARGB(255, 74, 74, 74),
          tabBackgroundColor: const Color.fromARGB(150, 100, 100, 100),
          gap: 8,
          padding: const EdgeInsets.all(12),
          tabs: [
            const GButton(
              icon: Icons.add_home,
              text: 'Home',
              iconColor: Colors.white,
              iconActiveColor: Color.fromARGB(255, 74, 195, 112),
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.whatshot,
              text: 'Duell',
              iconColor: Colors.white,
              iconActiveColor: const Color.fromARGB(255, 74, 195, 112),
              textColor: Colors.white,
            ),
            const GButton(
              icon: Icons.receipt_long_rounded,
              text: 'Rezepte',
              iconColor: Colors.white,
              iconActiveColor: Color.fromARGB(255, 74, 195, 112),
              textColor: Colors.white,
            ),
            const GButton(
              icon: Icons.group,
              text: 'Freunde',
              iconColor: Colors.white,
              iconActiveColor: Color.fromARGB(255, 74, 195, 112),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}