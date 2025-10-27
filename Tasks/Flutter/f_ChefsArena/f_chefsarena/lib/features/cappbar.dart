import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomAppBar({super.key, required this.text});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text, style: AppTheme.textTheme.bodyMedium),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: AppTheme.headlineColor,
    );
  }
}
