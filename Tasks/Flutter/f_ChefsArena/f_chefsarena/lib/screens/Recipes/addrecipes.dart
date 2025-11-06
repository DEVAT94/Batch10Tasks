// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:f_chefsarena/data/database_repo.dart';
import 'package:f_chefsarena/data/recipedata.dart';
import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/features/firebase_image_service.dart';
import 'package:f_chefsarena/features/imageselection.dart';
import 'package:f_chefsarena/features/recipetext.dart';
import 'package:f_chefsarena/screens/duel/rating.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class AddRecipePlayerOne extends StatefulWidget {
  const AddRecipePlayerOne({super.key});

  @override
  State<AddRecipePlayerOne> createState() => _AddRecipePlayerOneState();
}

class _AddRecipePlayerOneState extends State<AddRecipePlayerOne> {
  final _nameController = TextEditingController();
  final _ingredientsController = TextEditingController();
  File? _selectedImage;

  final _imageService = FirebaseImageService();
  final _recipeRepo = FirebaseRecipeRepository();

  Future<void> _saveRecipe() async {
    try {
      String? imageUrl;

      // 1️⃣ Falls ein Bild vorhanden ist → hochladen
      if (_selectedImage != null) {
        imageUrl = await _imageService.uploadRecipeImage(_selectedImage!);
      }

      // 2️⃣ Rezeptdaten speichern
      final recipe = RecipeData(
        id: '',
        recipeName: _nameController.text,
        ingredients: _ingredientsController.text,
        preparation: '',
        recipePicture: imageUrl,
      );

      await _recipeRepo.addRecipe(recipe);

      // 3️⃣ Navigation zur nächsten Seite
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RatingPlayerOne()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Fehler: $e')));
    }
  }

  Future<void> _pickImage() async {
    final path = await pickImage(context); // dein vorhandener Picker
    if (path != null) {
      setState(() => _selectedImage = File(path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(text: 'Spieler 1, speicher dein Rezept'),
      body: CustomBoxDeco(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                RecipeText(
                  controller: _nameController,
                  labelText: 'Rezept Name',
                  style: AppTheme.textTheme.bodySmall,
                ),
                const SizedBox(height: 32),
                RecipeText(
                  controller: _ingredientsController,
                  labelText: 'Zutaten und Zubereitung',
                  style: AppTheme.textTheme.bodySmall,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Bild auswählen'),
                ),
                const SizedBox(height: 32),
                CustomElevatedButton(
                  text: 'Speichern',
                  textStyle: AppTheme.textTheme.bodySmall,
                  backgroundColor: AppTheme.primaryColor,
                  width: 140,
                  onPressed: _saveRecipe,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddRecipePlayerTwo extends StatelessWidget {
  const AddRecipePlayerTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(text: 'Spieler 2, speicher dein Rezept'),
        body: CustomBoxDeco(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        RecipeText(
                          labelText: 'Rezept Name',
                          style: AppTheme.textTheme.bodySmall,
                          suffixIcon: Icon(
                            Icons.cancel_outlined,
                            color: AppTheme.cancel,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          height: 600,
                          child: RecipeText(
                            labelText: 'Zutaten und Zubereitung',
                            style: AppTheme.textTheme.bodySmall,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.top,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        SizedBox(height: 32),
                        CustomElevatedButton(
                          text: 'Speichern',
                          textStyle: AppTheme.textTheme.bodySmall,
                          backgroundColor: AppTheme.primaryColor,
                          width: 140,
                          elevation: WidgetStatePropertyAll(4),
                          onPressed: () {
                            pickImageAndNavigate(
                              context,
                              (imagePath) => RatingPlayerTwo(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
