import 'package:f_chefsarena/screens/duel/duel.dart';
import 'package:f_chefsarena/screens/Friends/friends.dart';
import 'package:f_chefsarena/screens/Home/home.dart';
import 'package:f_chefsarena/screens/Recipes/recipes.dart';
import 'package:f_chefsarena/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = const [
    HomeScreen(),
    DuelMode(),
    RecipeScreen(),
    FriendScreen(),
    SettingsScreen()
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    if (!_pageController.hasClients) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: _screens,
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 74, 74, 74),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          selectedIndex: _currentIndex,
          onTabChange: _onTabChanged,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: const Color.fromARGB(255, 74, 74, 74),
          tabBackgroundColor: const Color.fromARGB(150, 100, 100, 100),
          gap: 8,
          padding: const EdgeInsets.all(12),
          tabs: const [
            GButton(
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
              iconActiveColor: Color.fromARGB(255, 74, 195, 112),
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.receipt_long_rounded,
              text: 'Rezepte',
              iconColor: Colors.white,
              iconActiveColor: Color.fromARGB(255, 74, 195, 112),
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.group,
              text: 'Freunde',
              iconColor: Colors.white,
              iconActiveColor: Color.fromARGB(255, 74, 195, 112),
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.settings,
              text: 'Einstellungen',
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
