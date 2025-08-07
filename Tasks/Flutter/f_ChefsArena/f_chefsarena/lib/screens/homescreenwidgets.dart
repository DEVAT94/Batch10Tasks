import 'package:f_chefsarena/features/customcards.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        color: const Color.fromARGB(150, 74, 74, 74),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: Nico',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rang: Hobbykoch',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Erfahrungspunkte: 50 XP',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const LinearProgressIndicator(color: Colors.amber),
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
        color: const Color.fromARGB(150, 74, 74, 74),
        elevation: 20,
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thema des Tages',
                style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFF8BC34A),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Ein Sommergericht',
                style: TextStyle(fontSize: 20, color: Colors.white),
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
        color: const Color.fromARGB(150, 74, 74, 74),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Statistiken',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(thickness: 2, color: Colors.amber),
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
