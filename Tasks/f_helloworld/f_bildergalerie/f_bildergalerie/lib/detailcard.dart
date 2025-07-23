import 'package:f_bildergalerie/customappbar.dart';
import 'package:f_bildergalerie/custombottomnavbar.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String imageName;
  const DetailCard({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 40,
          children: [
            Expanded(flex: 2 ,child: Image.asset('assets/images/$imageName')),
            Text(LoremIpsum.text),        
          ],
        ),
        bottomNavigationBar: CustomNavBar(),
      );
  }
}

class LoremIpsum {
  static final String text = '''Lorem ipsum dolor sit amet, 
  consetetur sadipscing elitr, sed diam nonumy 
  eirmod tempor invidunt ut labore et dolore magna 
  aliquyam erat, sed diam voluptua. At vero eos et 
  accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
  no sea takimata sanctus est Lorem ipsum dolor sit amet.''';
}
