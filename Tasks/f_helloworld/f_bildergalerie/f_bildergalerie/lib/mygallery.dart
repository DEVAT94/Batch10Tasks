import 'package:f_bildergalerie/detailcard.dart';
import 'package:f_bildergalerie/details.dart';
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
          _buildCard('schaf.jpg', 'Tiere', '15.01.94', TextDetails.listText[0]),
          _buildCard(
            'feiern.png',
            'Festivals',
            '16.07.25',
            TextDetails.listText[1],
          ),
          _buildCard(
            'freunde.jpg',
            'Freunde',
            '04.10.23',
            TextDetails.listText[2],
          ),
          _buildCard(
            'games.png',
            'Games',
            '01.04.2014',
            TextDetails.listText[3],
          ),
          _buildCard(
            'essen.png',
            'Chef´s Arena Gerichte',
            '21.12.25',
            TextDetails.listText[4],
          ),
          _buildCard('kunst.png', 'Kunst', '13.08.16', TextDetails.listText[5]),
          _buildCard(
            'urlaub.png',
            'Urlaub',
            '22.07.19',
            TextDetails.listText[6],
          ),
          _buildCard(
            'wandern.jpg',
            'Wandern',
            '09.05.21',
            TextDetails.listText[7],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    String imagePath,
    String imageTitle,
    String imageDate,
    String imageDetails,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailCard(
              imagePath: imagePath,
              imageTitle: imageTitle,
              imageDate: imageDate,
              imageDetails: imageDetails,
            ),
          ),
        );
      },
      child: CustomCard(
        imagePath: imagePath,
        imageTitle: imageTitle,
        imageDate: imageDate,
        imageDetails: imageDetails,
      ),
    );
  }
}
