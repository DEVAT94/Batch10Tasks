import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void pickImageAndNavigate(
  BuildContext context,
  Widget Function(String imagePath) targetPageBuilder,
) async {
  final ImagePicker picker = ImagePicker();

  final source = await showDialog<ImageSource>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Foto auswählen'),
      content: const Text(
        'Möchtest du ein neues Foto aufnehmen oder ein vorhandenes auswählen?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, ImageSource.camera),
          child: const Text('Kamera'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, ImageSource.gallery),
          child: const Text('Album'),
        ),
      ],
    ),
  );

  if (source == null) return;

  final XFile? image = await picker.pickImage(source: source);
  if (image == null) return;

  final File selectedImage = File(image.path);

  if (context.mounted) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => targetPageBuilder(selectedImage.path),
      ),
    );
  }
}

/// Gibt den Pfad eines gewählten oder aufgenommenen Bildes zurück.
/// Gibt `null` zurück, wenn kein Bild ausgewählt wurde.
Future<String?> pickImage(BuildContext context) async {
  final picker = ImagePicker();

  return showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Bild auswählen'),
      content: const Text(
        'Möchtest du ein Foto aufnehmen oder aus der Galerie wählen?',
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final picked = await picker.pickImage(source: ImageSource.camera);
            Navigator.of(context).pop(picked?.path);
          },
          child: const Text('Kamera'),
        ),
        TextButton(
          onPressed: () async {
            final picked = await picker.pickImage(source: ImageSource.gallery);
            Navigator.of(context).pop(picked?.path);
          },
          child: const Text('Galerie'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text('Abbrechen'),
        ),
      ],
    ),
  );
}
