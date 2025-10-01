import 'package:cloud_firestore/cloud_firestore.dart';
import 'recipedata.dart';

class FirebaseRecipeDatabase {
  final CollectionReference _recipesRef =
      FirebaseFirestore.instance.collection('recipes');

  // Alle Rezepte laden
  Future<List<RecipeData>> getRecipes() async {
    final snapshot = await _recipesRef.get();
    return snapshot.docs
        .map((doc) => RecipeData.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  // Rezept hinzufügen
  Future<void> addRecipe(RecipeData recipe) async {
    await _recipesRef.add(recipe.toMap());
  }

  // Rezept löschen
  Future<void> deleteRecipe(String id) async {
    await _recipesRef.doc(id).delete();
  }

  // Rezept aktualisieren
  Future<void> updateRecipe(String id, RecipeData updated) async {
    await _recipesRef.doc(id).update(updated.toMap());
  }
}