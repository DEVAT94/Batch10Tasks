import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String description;
  final String? subTextDescription;
  final Color backgroundColor;
  final Color descriptionColor;
  final Color subTextColor;
  final double width;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double fontSize;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? child;

  const CustomCard({
    super.key,
    required this.description,
    this.subTextDescription,
    this.child,
    this.backgroundColor = const Color.fromARGB(150, 74, 74, 74),
    this.width = double.infinity,
    this.descriptionColor = Colors.amber,
    this.subTextColor = Colors.white,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.left,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: backgroundColor,
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                description,
                textAlign: textAlign,
                style: TextStyle(
                  color: descriptionColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
              ),
              Text(
                subTextDescription!,
                style: AppTheme.textTheme.labelMedium
              ),
              if (child != null) ...[const SizedBox(height: 16), child!],
            ],
          ),
        ),
      ),
    );
  }
}
