import 'package:f_chefsarena/features/customcards.dart';
import 'package:f_chefsarena/features/gnavbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Test'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber,
                Colors.yellowAccent,
                Color(0xFF8BC34A),
                Colors.blueGrey,
                Color.fromARGB(255, 74, 74, 74),
              ],
              stops: [0.1, 0.4, 0.6, 0.8, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Card(
                      color: Color.fromARGB(150, 74, 74, 74),
                      elevation: 20,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/Nico.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
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
                            SizedBox(height: 40),
                            Text(
                              'Erfahrungspunkte: 50 XP',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            LinearProgressIndicator(color: Colors.amber),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Card(
                      color: Color.fromARGB(150, 74, 74, 74),
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
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Card(
                      color: Color.fromARGB(150, 74, 74, 74),
                      elevation: 20,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Statistiken',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(thickness: 2, color: Colors.amber),

                            /*
                
                Bereich: Statistik-Cards

                */
                            SizedBox(height: 8),
                            CustomCard(
                              description: 'Anzahl der gekochten Gerichte:',
                              subTextDescription: '10',
                            ),
                            SizedBox(height: 8),
                            CustomCard(
                              description: 'Durchschnittsbewertung:',
                              subTextDescription: '4 von 10',
                            ),
                            SizedBox(height: 8),
                            CustomCard(
                              description: 'Lieblingsgegner:',
                              subTextDescription: 'Nico',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBarItems(),
      ),
    );
  }
}
