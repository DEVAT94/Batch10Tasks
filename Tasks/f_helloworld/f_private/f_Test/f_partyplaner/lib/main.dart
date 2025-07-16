import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Eventplaner'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name des Events:'),
            const Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name des Events',
                ),
              ),
            ),
            Row(children: [ClsDatePicker()]),
            Text('Location:', style: TextStyle()),
            const Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Location',
                ),
              ),
            ),
            Text('Anzahl der Personen:', style: TextStyle()),
            const Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '1 - ∞',
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Events'),
            BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Event erstellen'),
            BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Freunde')
          ]
        ),
      ),
    );
  }
}

class BottomNavList {
  String home;

  BottomNavList(this.home);
}

class ClsDatePicker extends StatefulWidget {
  const ClsDatePicker({super.key});

  @override
  State<ClsDatePicker> createState() => _ClsDatePickerState();
}

class _ClsDatePickerState extends State<ClsDatePicker> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Datum auswählen:'),
          ElevatedButton(onPressed: () async {}, child: Text('$dateTime')),
        ],
      ),
    );
  }
}
