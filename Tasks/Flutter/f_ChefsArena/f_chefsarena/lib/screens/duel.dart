import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/customcards.dart';
import 'package:flutter/material.dart';

class DuelMode extends StatelessWidget {
  const DuelMode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(),
        body: CustomBoxDeco(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: CustomCard(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    description: 'Duell starten?',
                    subTextDescription: '',
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
