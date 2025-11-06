import 'dart:io';
import 'package:f_chefsarena/data/mocktextdata.dart';
import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/customcards.dart';
import 'package:f_chefsarena/screens/Recipes/addrecipes.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

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

class RatingPlayerOne extends StatelessWidget {
  const RatingPlayerOne({super.key});

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomCard(
                  description: 'Bewertung Spieler 1',
                  subTextDescription: MockText().ratingSubText(),
                  fontSize: 32,
                  subTextFontSize: 14,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RatingPlayerTwo(),
                                ),
                              );
                            },
                            child: Text('OK', style: TextStyle(fontSize: 20)),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: WidgetStateProperty.all<Color>(
                                AppTheme.cancel,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Abbrechen',
                              style: TextStyle(fontSize: 20),
                            ),
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
      ),
    );
  }
}

class RatingPlayerTwo extends StatelessWidget {
  final String? imagePath;

  const RatingPlayerTwo({super.key, this.imagePath});

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomCard(
                  description: 'Bewertung Spieler 2',
                  subTextDescription: MockText().ratingSubText(),
                  fontSize: 32,
                  subTextFontSize: 14,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      if (imagePath != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(imagePath!),
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

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
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AddRecipePlayerOne(),
                                ),
                              );
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: WidgetStateProperty.all<Color>(
                                AppTheme.cancel,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Abbrechen',
                              style: TextStyle(fontSize: 20),
                            ),
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
      ),
    );
  }
}
