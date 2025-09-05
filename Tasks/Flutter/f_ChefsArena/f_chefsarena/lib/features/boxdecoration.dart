import 'package:flutter/material.dart';

class CustomBoxDeco extends StatelessWidget {
  final Widget child;
  const CustomBoxDeco({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints.expand(), // ⬅️ Container füllt den Screen
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 74, 74, 74),
            Colors.blueGrey,
            Color(0xFF8BC34A),
            Colors.yellowAccent,
            Colors.amber,
          ],
          stops: [0.1, 0.3, 0.6, 0.8, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
