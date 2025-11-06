import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseImageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadRecipeImage(File imageFile) async {
    try {
      final fileId = const Uuid().v4();
      final ref = _storage.ref().child('recipe_images/$fileId.jpg');

      final uploadTask = await ref.putFile(imageFile);
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      throw Exception('Fehler beim Hochladen des Bildes: $e');
    }
  }
}
