import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/features/friendlist.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(text: 'Freunde'),
        body: CustomBoxDeco(
          child: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: AppTheme.regularCardColor,
                              ),
                              child: Column(
                                children: const [
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
                                    name: 'Andreas',
                                    rang: 'Entremetier',
                                    imagePath: 'assets/images/Andreas.png',
                                  ),
                                  FriendList(
                                    name: 'Jens',
                                    rang: 'Hobbykoch',
                                    imagePath: 'assets/images/Jens.png',
                                  ),
                                  FriendList(
                                    name: 'Nicole',
                                    rang: 'Koch',
                                    imagePath: 'assets/images/Nicole.png',
                                  ),
                                  FriendList(
                                    name: 'Nina',
                                    rang: 'Tellerwäscher',
                                    imagePath: 'assets/images/Nina.png',
                                  ),
                                  FriendList(
                                    name: 'Jonas',
                                    rang: 'Chef de Cuisine',
                                    imagePath: 'assets/images/Jonas.png',
                                  ),
                                  FriendList(
                                    name: 'Richard',
                                    rang: 'Hobbykoch',
                                    imagePath: 'assets/images/Richard.png',
                                  ),
                                  FriendList(
                                    name: 'Senaid',
                                    rang: 'Entremetier',
                                    imagePath: 'assets/images/Senaid.png',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: CustomElevatedButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    text: 'Add',
                    textStyle: TextStyle(
                      color: AppTheme.headlineColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    iconColor: const WidgetStatePropertyAll(Colors.white),
                    iconSize: const WidgetStatePropertyAll(32),
                    backgroundColor: AppTheme.primaryColor,
                    width: 120,
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
