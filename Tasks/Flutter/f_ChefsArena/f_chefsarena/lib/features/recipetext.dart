import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class RecipeText extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? minLines;
  final int? maxLines;
  final bool expands;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const RecipeText({
    super.key,
    required this.labelText,
    this.controller,
    this.style,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.prefixIcon,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
    this.expands = false,
    this.floatingLabelBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: style,
      minLines: minLines,
      maxLines: maxLines,
      expands: expands,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTheme.textTheme.bodyMedium,
        floatingLabelBehavior: floatingLabelBehavior,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.cardColor, width: 4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.cardColor, width: 4),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
