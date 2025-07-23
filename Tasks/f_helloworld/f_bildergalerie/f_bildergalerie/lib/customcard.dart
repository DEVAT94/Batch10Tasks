import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String imagePath;
  final String imageTitle;
  final String imageDate;
  final String imageDetails;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.imageTitle,
    required this.imageDate,
    required this.imageDetails,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      color: const Color.fromARGB(221, 255, 255, 255),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/${widget.imagePath}',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Text(
            widget.imageTitle,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
