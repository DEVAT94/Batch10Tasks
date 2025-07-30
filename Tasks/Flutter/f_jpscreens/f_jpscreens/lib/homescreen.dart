import 'package:f_jpscreens/customelevatedbutton.dart';
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
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(image: AssetImage('assets/details/snack_snack.png')),
                  SizedBox(height: 100),
                  SizedBox(
                    width: 350,
                    height: 200,
                    child: Card(
                      color: Colors.black12,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Feeling Snackish Today?',
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
