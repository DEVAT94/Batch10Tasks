import 'package:blur/blur.dart';
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
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image(
                  image: AssetImage('assets/graphics/cupcake_chick.png'),
                ),
              ),
              SizedBox(
                child: Image(
                  image: AssetImage('assets/details/snack_snack.png'),
                ),
              ),
              Card(
                color: WidgetStateColor.transparent,
                child: Column(
                  children: [
                    Text(
                      'Feeling Snackish Today?',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Explore Angis most popular snack selection\nand get instantly happy.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateColor.transparent,
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      child: Text('Order now', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
