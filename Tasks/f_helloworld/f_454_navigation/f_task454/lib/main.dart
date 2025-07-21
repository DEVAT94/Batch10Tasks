import 'package:f_task454/likes_page.dart';
import 'package:f_task454/news_page.dart';
import 'package:f_task454/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _AppHomeState();
  }
}

// ignore: must_be_immutable
class _AppHomeState extends StatefulWidget {
  //int currentIndex;
  final List<Widget> screens = [NewsPage(), LikesPage(), ProfilePage()];
  _AppHomeState();

  @override
  State<_AppHomeState> createState() => __AppHomeStateState();
}

class __AppHomeStateState extends State<_AppHomeState> {
  int currentIndex = 0;
  final List<Widget> screens = const [NewsPage(), LikesPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.newspaper), label: 'News'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Likes'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          backgroundColor: Colors.lime,
        ),
      ),
    );
  }
}
