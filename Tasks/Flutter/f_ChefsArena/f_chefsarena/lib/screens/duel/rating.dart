import 'package:f_chefsarena/data/textdata.dart';
import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/customcards.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(text: 'Bewertung der Gerichte'),
        body: CustomBoxDeco(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: CustomCard(
                    description: 'Bewertung Spieler 1',
                    subTextDescription: ratingSubText(),
                    crossAxisAlignment: CrossAxisAlignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(children: [Row(children: [
                    
                  ],
                  )]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
