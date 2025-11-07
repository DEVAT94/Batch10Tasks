import 'dart:io';
import 'package:f_chefsarena/data/recipedb.dart';
import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:provider/provider.dart';
import 'package:f_chefsarena/features/recipetext.dart';
import 'package:f_chefsarena/screens/duel/rating.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:f_chefsarena/data/recipedata.dart';

class AddRecipeScreen extends StatefulWidget {
  final String playerName;
  final Widget nextScreen;

  const AddRecipeScreen({
    super.key,
    required this.playerName,
    required this.nextScreen,
  });

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _nameController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _preparationController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? _selectedImage;
  String? _imageUrl;
  bool _isUploading = false;

  Future<void> _pickImage() async {
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bildquelle wählen'),
        content: const Text(
          'Möchtest du ein neues Foto aufnehmen oder ein vorhandenes wählen?',
        ),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.camera_alt),
            label: const Text('Kamera'),
            onPressed: () => Navigator.pop(context, ImageSource.camera),
          ),
          TextButton.icon(
            icon: const Icon(Icons.photo),
            label: const Text('Galerie'),
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
          ),
        ],
      ),
    );

    if (source == null) return;

    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      setState(() => _selectedImage = File(pickedFile.path));
      await _uploadToCloudinary();
    }
  }

  Future<void> _uploadToCloudinary() async {
  if (_selectedImage == null) {
    debugPrint("Es wurde kein Bild ausgewählt.");
    return;
  }

  setState(() => _isUploading = true);
  debugPrint("🚀 Starte Upload zu Cloudinary...");

  try {
    final cloudinary = CloudinaryPublic('dya7ssy1x', 'recipes', cache: false);
    final response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        _selectedImage!.path,
        folder: 'images/recipes/${widget.playerName}',
      ),
    );

    debugPrint("Hat funktioniert: ${response.secureUrl}");
    setState(() {
      _imageUrl = response.secureUrl;
      _isUploading = false;
    });
  } catch (e, s) {
    debugPrint("Upload fehlgeschlagen: $e");
    debugPrintStack(stackTrace: s);
    setState(() => _isUploading = false);
  }
}

  Future<void> _saveRecipe() async {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);

    final recipe = RecipeData(
      id: '',
      recipeName: _nameController.text,
      ingredients: _ingredientsController.text,
      preparation: _preparationController.text,
      recipePicture: _imageUrl,
    );

    await recipeProvider.addRecipe(recipe);

    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => widget.nextScreen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(text: '${widget.playerName}, speichere dein Rezept'),
      body: CustomBoxDeco(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                RecipeText(
                  labelText: 'Rezept Name',
                  controller: _nameController,
                  style: AppTheme.textTheme.bodySmall,
                ),
                const SizedBox(height: 32),
                RecipeText(
                  labelText: 'Zutaten',
                  controller: _ingredientsController,
                  style: AppTheme.textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 16),
                RecipeText(
                  labelText: 'Zubereitung',
                  controller: _preparationController,
                  style: AppTheme.textTheme.bodySmall,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                ),
                const SizedBox(height: 24),

                if (_selectedImage != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      _selectedImage!,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                const SizedBox(height: 12),

                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.add_a_photo),
                  label: const Text('Bild auswählen'),
                ),

                const SizedBox(height: 20),

                if (_isUploading) const CircularProgressIndicator(),

                if (_selectedImage != null && !_isUploading)
                  ElevatedButton.icon(
                    onPressed: _uploadToCloudinary,
                    icon: const Icon(Icons.cloud_upload),
                    label: const Text('Bild hochladen'),
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

/// Verwendung für Spieler 1:
class AddRecipePlayerOne extends StatelessWidget {
  const AddRecipePlayerOne({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRecipeScreen(
      playerName: 'Spieler 1',
      nextScreen: const RatingPlayerOne(),
    );
  }
}

/// Verwendung für Spieler 2:
class AddRecipePlayerTwo extends StatelessWidget {
  const AddRecipePlayerTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRecipeScreen(
      playerName: 'Spieler 2',
      nextScreen: const RatingPlayerTwo(),
    );
  }
}
