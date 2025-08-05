import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String description;
  final String subTextDescription;
  final Color color;

  const CustomCard({
    super.key,
    required this.description,
    required this.subTextDescription,
    this.color = const Color.fromARGB(150, 74, 74, 74)
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: color,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTextDescription,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
