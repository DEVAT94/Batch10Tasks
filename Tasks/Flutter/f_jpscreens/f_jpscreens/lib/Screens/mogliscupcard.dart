import 'package:flutter/material.dart';

class MoglisCupCard extends StatelessWidget {
  const MoglisCupCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Stack(
            children: [Image(image: AssetImage('assets/graphics/cupkake_cat.png'))],
          ),
        ),
      ),
    );
  }
}
