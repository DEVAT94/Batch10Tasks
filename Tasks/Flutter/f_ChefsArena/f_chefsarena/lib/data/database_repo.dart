import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'recipedata.dart';

class FirebaseRecipeRepository {
  final CollectionReference<Map<String, dynamic>> _recipeRef =
      FirebaseFirestore.instance.collection('recipe');

  final FirebaseStorage _storage = FirebaseStorage.instance;

  // 📦 Alle Rezepte abrufen
  Future<List<RecipeData>> getRecipes() async {
    final snapshot = await _recipeRef.get();
    return snapshot.docs
        .map((doc) => RecipeData.fromMap(doc.data(), doc.id))
        .toList();
  }

  // 📄 Einzelnes Rezept abrufen
  Future<RecipeData?> getRecipe(String id) async {
    final doc = await _recipeRef.doc(id).get();
    if (doc.exists) {
      return RecipeData.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }
    return null;
  }

  // 🆕 Neues Rezept speichern (mit optionalem Bild)
  Future<String> addRecipe(RecipeData recipe, {File? imageFile}) async {
    String? imageUrl;

    // 🔹 Wenn ein Bild vorhanden ist → in Firebase Storage hochladen
    if (imageFile != null) {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final storageRef = _storage.ref().child('recipe_images/$fileName');

      // Datei hochladen
      await storageRef.putFile(imageFile);

      // Download-Link holen
      imageUrl = await storageRef.getDownloadURL();
    }

    // 🔹 Rezeptdaten in Firestore speichern
    final docRef = await _recipeRef.add({
      'recipeName': recipe.recipeName,
      'ingredients': recipe.ingredients,
      'preparation': recipe.preparation,
      'recipePicture': imageUrl ?? recipe.recipePicture, // 🔗 URL oder null
    });

    return docRef.id;
  }

  // 🔄 Rezept aktualisieren (optional mit neuem Bild)
  Future<void> updateRecipe(String id, RecipeData updated, {File? newImage}) async {
    String? imageUrl = updated.recipePicture;

    if (newImage != null) {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final storageRef = _storage.ref().child('recipe_images/$fileName');

      await storageRef.putFile(newImage);
      imageUrl = await storageRef.getDownloadURL();
    }

    await _recipeRef.doc(id).update({
      'recipeName': updated.recipeName,
      'ingredients': updated.ingredients,
      'preparation': updated.preparation,
      'recipePicture': imageUrl,
    });
  }

  // ❌ Rezept löschen (inkl. Bild, wenn vorhanden)
  Future<void> deleteRecipe(String id) async {
    final recipe = await getRecipe(id);
    if (recipe?.recipePicture != null) {
      try {
        final ref = _storage.refFromURL(recipe!.recipePicture!);
        await ref.delete();
      } catch (e) {
        print('⚠️ Bild konnte nicht gelöscht werden: $e');
      }
    }

    await _recipeRef.doc(id).delete();
  }

  // 🔁 Live-Stream der Rezepte
  Stream<List<RecipeData>> streamRecipes() {
    return _recipeRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return RecipeData.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }
}
