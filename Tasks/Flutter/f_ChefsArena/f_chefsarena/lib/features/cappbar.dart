import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomAppBar({
    super.key,
    required this.text,
    this.fontSize = 24,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.white,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
    );
  }
}
