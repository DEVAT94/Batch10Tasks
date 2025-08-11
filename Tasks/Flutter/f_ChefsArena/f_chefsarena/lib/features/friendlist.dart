import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class FriendList extends StatelessWidget {
  final String name;
  final String rang;
  final String imagePath;

  const FriendList({
    super.key,
    required this.name,
    required this.rang,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTheme.textTheme.bodyMedium),
                Text(rang, style: AppTheme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
        Divider(color: Colors.amber, thickness: 2),
      ],
    );
  }
}
