import 'package:f_jpscreens/Screens/homescreenbottom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrounds/bg_startscreen.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 120),
              SizedBox(
                child: Image(
                  image: AssetImage('assets/graphics/cupcake_chick.png'),
                ),
              ),
              HomeScreenBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}
