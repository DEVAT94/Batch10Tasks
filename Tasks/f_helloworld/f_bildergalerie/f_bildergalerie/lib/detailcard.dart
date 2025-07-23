import 'package:f_bildergalerie/customappbar.dart';
import 'package:f_bildergalerie/custombottomnavbar.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String imagePath;
  final String imageTitle;
  final String imageDate;
  final String imageDetails;

  const DetailCard({
    super.key,
    required this.imagePath,
    required this.imageTitle,
    required this.imageDate,
    required this.imageDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Details'),
      body: GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        children: [
          Image.asset('assets/images/$imagePath'),
          DetailCardText(
            title: imageTitle,
            textDate: imageDate,
            details: imageDetails,
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class DetailCardText extends StatelessWidget {
  final String details;
  final String title;
  final String textDate;

  const DetailCardText({
    super.key,
    required this.title,
    required this.textDate,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        SizedBox(height: 20),
        Text(textDate),
        SizedBox(height: 20),
        Text(details),
      ],
    );
  }
}
