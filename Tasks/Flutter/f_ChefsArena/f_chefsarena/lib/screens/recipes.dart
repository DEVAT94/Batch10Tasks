import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/customcards.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(text: 'Rezepte'),
      body: CustomBoxDeco(
        child: SafeArea(child: CustomCard(description: 'Test', subTextDescription: '',),
        )
      )
    );
  }
}