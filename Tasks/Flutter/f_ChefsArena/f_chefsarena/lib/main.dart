
import 'package:f_chefsarena/screens/Recipes/addrecipes.dart';
import 'package:f_chefsarena/screens/Recipes/recipes.dart';
import 'package:f_chefsarena/screens/duel/rating.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddRecipes()
    );
  }
}
