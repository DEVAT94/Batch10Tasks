import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const CustomAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: true,
      title: Text(appBarTitle),
      centerTitle: true,
      foregroundColor: const Color.fromARGB(221, 255, 255, 255),
      iconTheme: IconThemeData(color: const Color.fromARGB(221, 255, 255, 255)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
