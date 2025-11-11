import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final ImageIcon? imageIcon;
  final Icon? icon;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final WidgetStatePropertyAll<Color>? iconColor;
  final WidgetStatePropertyAll<double>? iconSize;
  final WidgetStatePropertyAll<double>? elevation;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
    this.text,
    this.imageIcon,
    this.icon,
    this.backgroundColor = Colors.black,
    this.borderColor = Colors.white,
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
    final bool hasText = text != null && text!.isNotEmpty;

    return SizedBox(
      width: width,
      height: height,
      child: (usedIcon != null && hasText)
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: usedIcon,
              label: Text(text!, style: textStyle),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                iconColor: iconColor,
                iconSize: iconSize,
                elevation: elevation,
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: borderColor)
                  ),
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                iconColor: iconColor,
                elevation: elevation,
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: borderColor)
                  ),
                ),
              ),
              child: usedIcon ?? const SizedBox.shrink(),
            ),
    );
  }
}
