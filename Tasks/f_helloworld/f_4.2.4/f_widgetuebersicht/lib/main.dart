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
          backgroundColor: Colors.lightBlue,
          title: Text('Aufgabe 1'),
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: Text(
                  'Hello App Akademie!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    width: 60,
                    height: 60,
                    margin: EdgeInsetsDirectional.only(end: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                          ),
                          child: Center(child: Text('A')),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    width: 60,
                    height: 60,
                    margin: EdgeInsetsDirectional.only(end: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                          ),
                          child: Center(child: Text('B')),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    width: 60,
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                          ),
                          child: Center(child: Text('C')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                  ),
                  Row(
                    spacing: 100,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: Icon(Icons.face),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Icon(Icons.face),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
