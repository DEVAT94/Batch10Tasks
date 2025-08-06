import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String description;
  final String subTextDescription;
  final Color backgroundColor;
  final Color foregroundDescription;
  final Color foregroundSubText;
  final double width;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double fontSize;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget child;

  const CustomCard({
    super.key,
    required this.description,
    required this.subTextDescription,
    this.child = Column(),
    this.backgroundColor = const Color.fromARGB(150, 74, 74, 74),
    this.width = double.infinity, 
    this.foregroundDescription = Colors.amber, 
    this.foregroundSubText = Colors.white, 
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.left,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.fontSize = 16
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
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Text(
                description,
                textAlign: textAlign,
                style: TextStyle(
                  color: foregroundDescription,
                  fontWeight: fontWeight,
                  fontSize: fontSize
                ),
              ),
              Text(
                subTextDescription,
                style: TextStyle(
                  color: foregroundSubText,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
