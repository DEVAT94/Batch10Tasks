import 'package:cloud_firestore/cloud_firestore.dart';
import 'recipedata.dart';

class FirebaseRecipeRepository {
  final CollectionReference _recipeRef =
      FirebaseFirestore.instance.collection('recipe');

  Future<List<RecipeData>> getRecipes() async {
    final snapshot = await _recipeRef.get();
    return snapshot.docs
        .map((doc) => RecipeData.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<RecipeData?> getRecipe(String id) async {
    final doc = await _recipeRef.doc(id).get();
    if (doc.exists) {
      return RecipeData.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }
    return null;
  }

  Future<String> addRecipe(RecipeData recipe) async {
    final docRef = await _recipeRef.add(recipe.toMap());
    return docRef.id;
  }

  Future<void> updateRecipe(String id, RecipeData updated) async {
    await _recipeRef.doc(id).update(updated.toMap());
  }

  Future<void> deleteRecipe(String id) async {
    await _recipeRef.doc(id).delete();
  }

  Stream<List<RecipeData>> streamRecipes() {
    return _recipeRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return RecipeData.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
