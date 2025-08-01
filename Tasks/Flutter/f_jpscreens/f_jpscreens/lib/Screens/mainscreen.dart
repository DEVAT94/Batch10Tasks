import 'dart:ui';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:f_jpscreens/CustomWidgets/customelevatedbutton.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      Tab(text: 'All categories', icon: Icon(Icons.fastfood_outlined)),
      Tab(text: 'Salty'),
      Tab(text: 'Sweet'),
      Tab(text: 'Exotic'),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrounds/bg_mainscreen.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  'Choose Your Favorite\nSnack',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: DefaultTabController(
                    length: 4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ButtonsTabBar(
                        tabs: tabs,
                        unselectedBackgroundColor: Colors.black12,
                        backgroundColor: Colors.white.withValues(alpha: 0.8),
                        borderColor: Colors.white.withValues(alpha: 0.5),
                        unselectedLabelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        radius: 20,
                        borderWidth: 1,
                        width: 140,
                        contentCenter: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 140, top: 60),
                      child: Image(
                        image: AssetImage('assets/graphics/burger.png'),
                        width: 240,
                      ),
                    ),
                    SizedBox(height: 100),
                    SizedBox(
                      width: 400,
                      height: 200,
                      child: Card(
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  'assets/details/cut_card.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Angi´s Yummy Burger',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(width: 80),
                                            Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                255,
                                                233,
                                                112,
                                                197,
                                              ),
                                            ),
                                            Text(
                                              '4.8',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Text(
                                      'Delish vegan burger\nthat tastes like heaven',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Row(
                                      children: [
                                        ImageIcon(
                                          Image.asset(
                                            'assets/details/austral-sign-solid-full.png',
                                          ).image,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '13.99',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
    );
  }
}
