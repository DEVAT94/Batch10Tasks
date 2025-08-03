import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  const CustomCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 160,
      child: Card(
        color: Colors.transparent,
        child: Column(
          children: [
            Image.asset('assets/graphics/icecream.png', scale: 4),
            SizedBox(height: 10),
            Text(
              'Balu´s Cup',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Pistachio ice cream',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            SizedBox(height: 16),
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
                    '8.99',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Spacer(flex: 1),
                  Icon(Icons.favorite_border, color: Colors.white),

                  Text(
                    '300',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
