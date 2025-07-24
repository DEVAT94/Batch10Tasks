import 'package:flutter/material.dart';

class DetailCard extends StatefulWidget {
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
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: const Color.fromARGB(221, 255, 255, 255),
        iconTheme: IconThemeData(
          color: const Color.fromARGB(221, 255, 255, 255),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 1,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            child: Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/${widget.imagePath}',
                fit: BoxFit.cover,
                width: 10,
              ),
            ),
          ),

          DetailCardText(
            title: widget.imageTitle,
            textDate: widget.imageDate,
            details: widget.imageDetails,
          ),
        ],
      ),
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
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 40,
              color: const Color.fromARGB(221, 255, 255, 255),
            ),
          ),
          SizedBox(height: 10),
          Text(
            textDate,
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(221, 255, 255, 255),
            ),
          ),
          SizedBox(height: 20),
          Text(
            details,
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(221, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
