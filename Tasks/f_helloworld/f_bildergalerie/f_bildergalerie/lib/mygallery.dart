import 'package:f_bildergalerie/detailcard.dart';
import 'package:flutter/material.dart';
import 'package:f_bildergalerie/customcard.dart';

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
          _buildCard('Tiere', 'schaf.jpg'),
          _buildCard('Feiern', 'feiern.png'),
          _buildCard('Freunde', 'freunde.jpg'),
          _buildCard('Games', 'games.png'),
          _buildCard('Chef´s Arena Gerichte', 'essen.png'),
          _buildCard('Kunst', 'kunst.png'),
          _buildCard('Urlaub', 'urlaub.png'),
          _buildCard('Wandern', 'wandern.jpg'),
        ],
      ),
    );
  }

  Widget _buildCard(String text, String imageName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailCard(
              imageName: imageName,
            ),
          ),
        );
      },
      child: CustomCard(text: text, imageName: imageName),
    );
  }
}

