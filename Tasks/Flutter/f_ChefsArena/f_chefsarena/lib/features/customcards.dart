import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String description;
  final String subTextDescription;
  final Color backgroundColor;
  final Color foregroundDescription;
  final Color foregroundSubText;
  final double width;

  const CustomCard({
    super.key,
    required this.description,
    required this.subTextDescription,
    this.backgroundColor = const Color.fromARGB(150, 74, 74, 74),
    this.width = double.infinity, 
    this.foregroundDescription = Colors.amber, 
    this.foregroundSubText = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: backgroundColor,
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: TextStyle(
                  color: foregroundDescription,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTextDescription,
                style: TextStyle(
                  color: foregroundSubText,
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
