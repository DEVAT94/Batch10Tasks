import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/customcards.dart';
import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(text: 'Freunde'),
      body: CustomBoxDeco(
        child: SafeArea(child: CustomCard(description: 'Test', subTextDescription: '',),
        )
      )
    );
  }
}