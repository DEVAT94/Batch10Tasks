import 'dart:async';

import 'package:f_chefsarena/data/recipedata.dart';

class MockRecipeDatabase {
  final List<RecipeData> _recipes = [];

  // Alle Rezepte laden
  Future<List<RecipeData>> getRecipes() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.unmodifiable(_recipes);
  }

  // Rezept hinzufügen
  Future<void> addRecipe(RecipeData recipe) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _recipes.add(recipe);
  }

  // Rezept löschen
  Future<void> deleteRecipe(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _recipes.removeWhere((r) => r.id == id);
  }

  // Rezept aktualisieren
  Future<void> updateRecipe(String id, RecipeData updated) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _recipes.indexWhere((r) => r.id == id);
    if (index != -1) {
      _recipes[index] = updated;
    }
  }
}