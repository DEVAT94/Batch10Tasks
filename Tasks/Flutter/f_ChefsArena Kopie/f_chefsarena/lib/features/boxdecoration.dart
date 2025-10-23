import 'package:flutter/material.dart';

class CustomBoxDeco extends StatelessWidget {
  final Widget child;
  const CustomBoxDeco({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueGrey,
            Color(0xFF8BC34A),
            Colors.yellowAccent,
            Colors.amber,
          ],
          stops: [0.1, 0.4, 0.8, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
