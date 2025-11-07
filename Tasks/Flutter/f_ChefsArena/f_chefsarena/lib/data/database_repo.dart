import 'package:cloud_firestore/cloud_firestore.dart';
import 'recipedata.dart';

class FirebaseRecipeRepository {
  final CollectionReference<Map<String, dynamic>> _recipeRef = FirebaseFirestore
      .instance
      .collection('recipe');

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

  // 🔁 Live-Stream der Rezepte
  Stream<List<RecipeData>> streamRecipes() {
    return _recipeRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return RecipeData.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> addRecipe(RecipeData recipe) async {
    await _recipeRef.add(recipe.toMap());
  }

  Future<void> deleteRecipe(String id) async {
    await _recipeRef.doc(id).delete();
  }
}
