import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Text drawerHeader;
  final Text listTileText;

  const CustomDrawer({
    super.key,
    this.drawerHeader = const Text('Menü'),
    this.listTileText = const Text('Logout'),
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.cardColor,
      child: ListView(
        children: [
          DrawerHeader(child: drawerHeader),
          ListTile(title: listTileText),
        ],
      ),
    );
  }
}
