import 'dart:ui';
import 'package:f_jpscreens/CustomWidgets/customelevatedbutton.dart';
import 'package:flutter/material.dart';

class HomeScreenBottomPart extends StatelessWidget {
  const HomeScreenBottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(image: AssetImage('assets/details/snack_snack.png')),
        SizedBox(height: 100),
        SizedBox(
          width: 350,
          height: 200,
          child: Card(
            color: Colors.transparent,
            child: ClipRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Feeling Snackish Today?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Explore Angis most popular snack selection\nand get instantly happy',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    CustomElevatedBtn(
                      width: 180,
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(10),
                      child: Text(
                        'Order Now',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
