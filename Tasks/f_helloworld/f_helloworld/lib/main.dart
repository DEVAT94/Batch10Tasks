import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello W0rld'),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          shadowColor: Color.fromARGB(0, 0, 0, 0),
        ),
        body: Center(
          child: Container(
            color: const Color.fromARGB(255, 246, 246, 246),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Text('Text 1'),
                      ),
                      SizedBox(
                        width: 50,
                        height: 0,
                        child: Divider(
                          thickness: 5,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Text('Text 2'),
                      ),
                      SizedBox(£
                        width: 50,
                        height: 0,
                        child: Divider(
                          thickness: 5,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Text('Text 3'),
                      )
                  ],
                )
              ],
            ),
          ),
        ),
          bottomNavigationBar: BottomAppBar(
          color: Colors.deepPurple,
        ),
      ),
    
    );
  }
}
