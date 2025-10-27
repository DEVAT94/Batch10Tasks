import 'package:f_chefsarena/screens/Home/homescreenwidgets.dart';
import 'package:flutter/material.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/boxdecoration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(text: 'HomeScreen'),
        body: CustomBoxDeco(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileCard(),
                  const SizedBox(height: 20),
                  ToDaysTopic(),
                  const SizedBox(height: 20),
                  StatsCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
