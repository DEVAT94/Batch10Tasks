import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String imageName;
  const CustomCard({super.key, required this.text, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            color: const Color.fromARGB(255, 232, 232, 232),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/images/$imageName',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Text(text, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          );
  }
}
