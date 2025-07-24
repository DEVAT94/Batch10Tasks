import 'package:flutter/material.dart';

class Aboutme extends StatelessWidget {
  const Aboutme({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: [
        SizedBox(
          height: 10,
          width: 10,
          child:  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(500),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          color: const Color.fromARGB(221, 255, 255, 255),
          child: Image.asset('assets/images/ralf.png', fit: BoxFit.fill, width: 5, height: 5,),
        ),),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ralf Schumacher', style: TextStyle(fontSize: 40)),
            Text('Wieviel ist dein Auto wert?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
