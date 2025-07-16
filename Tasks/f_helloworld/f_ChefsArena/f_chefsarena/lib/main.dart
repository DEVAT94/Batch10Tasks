import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 74, 195, 112),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 74, 74, 74),
          centerTitle: true,
          title: Text(
            'Home',
            style: TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Card(
                elevation: 4,
                color: Color.fromARGB(255, 74, 74, 74),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: Alex',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            'Rang: Hobbykoch',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),

                      Divider(color: Colors.amber),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Card(
                elevation: 4,
                color: Color.fromARGB(255, 74, 74, 74),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thema des Tages',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Ein Sommergericht',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 380,
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Card(
                elevation: 4,
                color: Color.fromARGB(255, 74, 74, 74),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Statistiken',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        spacing: 2,
                        children: [
                          Card(
                            elevation: 4,
                            color: const Color.fromARGB(255, 156, 241, 193),
                            child: Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 160,
                                top: 40,
                                right: 160,
                                bottom: 40,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 4,
                            color: const Color.fromARGB(255, 156, 241, 193),
                            child: Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 160,
                                top: 40,
                                right: 160,
                                bottom: 40,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 6,
                            color: const Color.fromARGB(255, 156, 241, 193),
                            child: Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 160,
                                top: 40,
                                right: 160,
                                bottom: 40,
                              ),
                              child: Row(
                                children: [
                                  Text('Platzhalter')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBarItems(),
      ),
    );
  }
}

class BottomNavBarItems extends StatelessWidget {
  const BottomNavBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      backgroundColor: Color.fromARGB(255, 74, 74, 74),
      //tabMargin: EdgeInsetsGeometry.zero,
      tabs: [
        GButton(
          icon: Icons.add_home,
          iconColor: Colors.white,
          iconActiveColor: const Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Home',
          style: GnavStyle.oldSchool,
        ),
        GButton(
          icon: Icons.cookie,
          iconColor: Colors.white,
          iconActiveColor: const Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Duell',
        ),
        GButton(
          icon: Icons.receipt_long_rounded,
          iconColor: Colors.white,
          iconActiveColor: const Color.fromARGB(255, 74, 195, 112),
          activeBorder: Border.symmetric(),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Rezepte',
        ),
        GButton(
          icon: Icons.group,
          iconColor: Colors.white,
          iconActiveColor: const Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Freunde',
        ),
      ],
    );
  }
}
