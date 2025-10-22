import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final ImageIcon? imageIcon;
  final Icon? icon;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final WidgetStatePropertyAll<Color>? iconColor;
  final WidgetStatePropertyAll<double>? iconSize;
  final WidgetStatePropertyAll<double>? elevation;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.imageIcon,
    this.icon,
    this.backgroundColor = Colors.black,
    this.textStyle,
    this.width = 200,
    this.height = 50,
    this.elevation,
    this.iconColor,
    this.iconSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Widget? usedIcon = imageIcon ?? icon;

    return SizedBox(
      width: width,
      height: height,
      child: usedIcon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              label: Text(text, style: textStyle),
              icon: usedIcon,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                iconColor: iconColor,
                iconSize: iconSize,
                elevation: elevation,
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                elevation: elevation,
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              child: Text(text, style: textStyle),
            ),
    );
  }
}
