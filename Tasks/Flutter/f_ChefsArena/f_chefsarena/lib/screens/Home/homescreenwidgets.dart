import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_chefsarena/data/userdata.dart';
import 'package:f_chefsarena/features/customcards.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  Future<UserData?> _loadUserData() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return null;

  final doc = await FirebaseFirestore.instance.collection('user').doc(user.uid).get();
  if (!doc.exists) return null;

  return await UserData.fromFirestoreWithRank(doc);
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserData?>(
      future: _loadUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("Keine Benutzerdaten gefunden."));
        }

        final user = snapshot.data!;
        final percent = (user.xp / 100).clamp(
          0,
          1.0,
        );

        return SizedBox(
          height: 200,
          width: double.infinity,
          child: Card(
            color: AppTheme.regularCardColor,
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
                            image: AssetImage('assets/images/Me.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${user.firstName} ${user.lastName}',
                            style: AppTheme.textTheme.bodyMedium,
                          ),
                          Text(
                            'Rang: ${user.title}',
                            style: AppTheme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  LinearPercentIndicator(
                    width: 340,
                    lineHeight: 20.0,
                    percent: percent.toDouble(),
                    backgroundColor: AppTheme.headlineColor,
                    progressColor: AppTheme.secondaryColor,
                    barRadius: const Radius.circular(10),
                    center: Text(
                      'Erfahrung: ${(percent * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        color: AppTheme.cardColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//UNDER CONSTRUCTION
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
              Text('Thema des Tages', style: AppTheme.textTheme.headlineLarge),
              Text(
                '>> Ein Sommergericht <<',
                style: AppTheme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//UNDER CONSTRUCTION
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
                  style: AppTheme.textTheme.bodyMedium,
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
