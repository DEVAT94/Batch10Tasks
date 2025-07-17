import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 74, 195, 112),
        appBar: AppBar(
          elevation: 40,
          backgroundColor: const Color.fromARGB(255, 74, 74, 74),
          centerTitle: true,
          title: const Text(
            'Home',
            style: TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),

                /*
                
                Bereich: Profildaten

                */
                child: Card(
                  elevation: 4,
                  color: const Color.fromARGB(255, 74, 74, 74),
                  child: Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: Alex',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'Rang: Hobbykoch',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(right: 100),
                          child: Column(
                            children: [
                              Text(
                                'Erfahrungspunkte: 50 XP',
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.white),
                              ),
                              LinearProgressIndicator(color: Colors.amber),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),

                /*
                
                Bereich: Thema des Tages

                */
                child: Card(
                  elevation: 4,
                  color: const Color.fromARGB(255, 74, 74, 74),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thema des Tages',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.lightGreen,
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
              ),

              /*
                
                Bereich: Statistiken

                */
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Card(
                  elevation: 4,
                  color: const Color.fromARGB(255, 74, 74, 74),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(color: Colors.red, height: 10),
                        Text(
                          'Statistiken',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        /*
                
                Bereich: Statistik-Cards

                */
                        SizedBox(height: 20),
                        CustomCard(
                          description: 'Anzahl der gekochten Gerichte:',
                          subTextDescription: '10',
                        ),
                        SizedBox(height: 10),
                        CustomCard(
                          description: 'Durchschnittsbewertung:',
                          subTextDescription: '4 von 10',
                        ),
                        SizedBox(height: 10),
                        CustomCard(
                          description: 'Lieblingsgegner:',
                          subTextDescription: 'Nico',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        /*
                
                Bereich: Bottom Google NavBar

                */
        bottomNavigationBar: const BottomNavBarItems(),
      ),
    );
  }
}

//Google NavBar Class
class BottomNavBarItems extends StatelessWidget {
  const BottomNavBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      backgroundColor: const Color.fromARGB(255, 74, 74, 74),
      tabs: const [
        GButton(
          icon: Icons.add_home,
          iconColor: Colors.white,
          iconActiveColor: Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Home',
          style: GnavStyle.oldSchool,
        ),
        GButton(
          icon: Icons.cookie,
          iconColor: Colors.white,
          iconActiveColor: Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Duell',
        ),
        GButton(
          icon: Icons.receipt_long_rounded,
          iconColor: Colors.white,
          iconActiveColor: Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Rezepte',
        ),
        GButton(
          icon: Icons.group,
          iconColor: Colors.white,
          iconActiveColor: Color.fromARGB(255, 74, 195, 112),
          textColor: Colors.white,
          hoverColor: Colors.yellow,
          text: 'Freunde',
        ),
      ],
    );
  }
}

//CustomCard Class
class CustomCard extends StatelessWidget {
  final String description;
  final String subTextDescription;

  const CustomCard({
    super.key,
    required this.description,
    required this.subTextDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: const Color.fromARGB(255, 156, 241, 193),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                subTextDescription,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
