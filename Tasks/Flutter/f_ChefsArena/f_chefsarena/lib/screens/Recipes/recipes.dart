import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/rezeptcard.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(text: 'Rezepte'),
        body: CustomBoxDeco(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: const [
                  RecipeCard(
                    profilBild: 'assets/images/Markus.png',
                    name: 'Nudelsalat von Markus',
                    kategorie: 'Sommergericht',
                    gerichtBild: 'assets/images/nudelsalat.jpg',
                    zutaten: [
                      '400 g Nudeln (z.B. Fusilli, Farfalle oder Penne)',
                      '300 ml passierte Tomaten',
                      '50 ml Olivenöl extra nativ',
                      '1 TL Salz',
                      '1 TL Pfeffer',
                      '1 TL italienische Kräuter',
                    ],
                  ),
                  SizedBox(height: 20),
                  RecipeCard(
                    profilBild: 'assets/images/Me.jpg',
                    name: 'Bacon Guacamole Burger von Alex',
                    kategorie: 'Sommergericht',
                    gerichtBild: 'assets/images/burger.jpg',
                    zutaten: [
                      '6 Burger Patties aus Ribeye Steak'
                      '6 Scheiben Cheddar Käse'
                      'Guacamole'
                      '1 Hand voll Tortilla Chips'
                      'Lollo Bionda Salatblätter'
                      'BBQ Sauce scharf',
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
