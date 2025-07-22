import 'package:f_bildergalerie/customcard.dart';
import 'package:flutter/material.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({super.key});

  @override
  State<MyGallery> createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          CustomCard(text: 'Tiere', imageName: 'schaf.jpg'),
          CustomCard(text: 'Feiern', imageName: 'feiern.png'),
          CustomCard(text: 'Freunde', imageName: 'freunde.jpg'),
          CustomCard(text: 'Games', imageName: 'games.png'),
          CustomCard(text: 'Chef´s Arena Gerichte', imageName: 'essen.png'),
          CustomCard(text: 'Kunst', imageName: 'kunst.png'),
          CustomCard(text: 'Urlaub', imageName: 'urlaub.png'),
          CustomCard(text: 'Wandern', imageName: 'wandern.jpg')
        ],
      ),
    );
  }
}
