import 'package:f_chefsarena/data/mocktextdata.dart';
import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/customcards.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    final ratingNames = [
      'Geschmack',
      'Optik',
      'Preis',
      'Thema getroffen?',
      'Zeit',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(text: 'Bewertung der Gerichte'),
        body: CustomBoxDeco(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomCard(
                description: 'Bewertung Spieler 1',
                subTextDescription: MockText().ratingSubText(),
                fontSize: 32,
                subTextFontSize: 14,
                crossAxisAlignment: CrossAxisAlignment.center,
                height: 600,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    ...ratingNames.map((name) => Ratings(ratingName: name)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.all<Color>(
                              AppTheme.primaryColor,
                            ),
                          ),
                          onPressed: () {},
                          child: Text('OK', style: TextStyle(fontSize: 20),),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.all<Color>(
                              AppTheme.cancel,
                            ),
                          ),
                          onPressed: () {},
                          child: Text('Abbrechen', style: TextStyle(fontSize: 20),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Ratings extends StatelessWidget {
  final String ratingName;

  const Ratings({super.key, required this.ratingName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ratingName, style: AppTheme.textTheme.bodySmall),
            Text('Rating', style: AppTheme.textTheme.bodySmall),
          ],
        ),
        SizedBox(height: 24),
        Divider(thickness: 2, color: AppTheme.primaryColor),
        SizedBox(height: 24),
      ],
    );
  }
}
