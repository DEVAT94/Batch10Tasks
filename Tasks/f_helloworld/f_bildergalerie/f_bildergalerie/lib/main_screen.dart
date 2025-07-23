import 'package:f_bildergalerie/customappbar.dart';
import 'package:f_bildergalerie/custombottomnavbar.dart';
import 'package:f_bildergalerie/mygallery.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(appBarTitle: 'MyGallery'),
        body: MyGallery(),
        bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}
