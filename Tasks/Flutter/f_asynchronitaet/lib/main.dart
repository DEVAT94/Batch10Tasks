import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isLoading = false;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isLoading)
                const CircularProgressIndicator()
              else if (_result.isNotEmpty)
                Text(_result)
              else
                const Text("Go"),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });

                  final res = await ausgabe("Go");

                  setState(() {
                    _result = res;
                    _isLoading = false;
                  });
                },
                child: const Text('Press me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> ausgabe(String word) async {
  await Future.delayed(const Duration(seconds: 3));
  return word + word + word;
}
