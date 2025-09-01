import 'package:f_chefsarena/features/customcards.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        color: AppTheme.themeData.cardColor,
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Nico.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: Nico',
                        style: AppTheme.textTheme.bodyMedium
                      ),
                      Text(
                        'Rang: Hobbykoch',
                        style: AppTheme.textTheme.bodyMedium
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Erfahrungspunkte: 50 XP',
                textAlign: TextAlign.justify,
                style: AppTheme.textTheme.labelLarge
              ),
              const LinearProgressIndicator(color: AppTheme.secondaryColor),
            ],
          ),
        ),
      ),
    );
  }
}

class ToDaysTopic extends StatelessWidget {
  const ToDaysTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Card(
        color: AppTheme.regularCardColor,
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thema des Tages',
                style: AppTheme.textTheme.headlineLarge
              ),
              Text(
                'Ein Sommergericht',
                style: AppTheme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: AppTheme.regularCardColor,
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Statistiken',
                  style: AppTheme.textTheme.bodyMedium
                ),
              ),
              const Divider(thickness: 2, color: AppTheme.secondaryColor),
              const SizedBox(height: 8),
              const CustomCard(
                description: 'Anzahl der durchgeführten Duelle:',
                subTextDescription: '10',
              ),
              const SizedBox(height: 8),
              const CustomCard(
                description: 'Durchschnittsbewertung:',
                subTextDescription: '4 von 10',
              ),
              const SizedBox(height: 8),
              const CustomCard(
                description: 'Lieblingsgegner:',
                subTextDescription: 'Nico',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
