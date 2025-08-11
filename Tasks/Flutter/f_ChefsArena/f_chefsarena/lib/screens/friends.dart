import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/friendlist.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(text: 'Freunde'),
      body: CustomBoxDeco(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppTheme.cardColor,
                  ),
                  child: Column(
                    children: [
                      FriendList(
                        name: 'Nico',
                        rang: 'Hobbykoch',
                        imagePath: 'assets/images/Nico.png',
                      ),
                      FriendList(
                        name: 'Anna',
                        rang: 'Koch',
                        imagePath: 'assets/images/Anna.png',
                      ),
                      FriendList(
                        name: 'Anton',
                        rang: 'Tellerwäscher',
                        imagePath: 'assets/images/Anton.png',
                      ),
                      FriendList(
                        name: 'Lisa',
                        rang: 'Chef de Cuisine',
                        imagePath: 'assets/images/Lisa.png',
                      ),
                      FriendList(
                        name: 'Markus',
                        rang: 'Hobbykoch',
                        imagePath: 'assets/images/Markus.png',
                      ),
                      FriendList(
                        name: 'Alex',
                        rang: 'Chef de Partie',
                        imagePath: 'assets/images/Me.jpg',
                      ),
                      FriendList(
                        name: 'Andreas',
                        rang: 'Entremetier',
                        imagePath: 'assets/images/Andreas.png',
                      ),
                      FriendList(
                        name: 'Nico',
                        rang: 'Hobbykoch',
                        imagePath: 'assets/images/Nico.png',
                      ),
                      FriendList(
                        name: 'Anna',
                        rang: 'Koch',
                        imagePath: 'assets/images/Anna.png',
                      ),
                      FriendList(
                        name: 'Anton',
                        rang: 'Tellerwäscher',
                        imagePath: 'assets/images/Anton.png',
                      ),
                      FriendList(
                        name: 'Lisa',
                        rang: 'Chef de Cuisine',
                        imagePath: 'assets/images/Lisa.png',
                      ),
                      FriendList(
                        name: 'Markus',
                        rang: 'Hobbykoch',
                        imagePath: 'assets/images/Markus.png',
                      ),
                      FriendList(
                        name: 'Alex',
                        rang: 'Chef de Partie',
                        imagePath: 'assets/images/Me.jpg',
                      ),
                      FriendList(
                        name: 'Andreas',
                        rang: 'Entremetier',
                        imagePath: 'assets/images/Andreas.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
