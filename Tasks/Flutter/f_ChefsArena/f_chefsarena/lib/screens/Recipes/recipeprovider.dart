// recipe_provider.dart
import 'package:flutter/material.dart';
import 'package:f_chefsarena/data/database_repo.dart';
import 'package:f_chefsarena/data/recipedata.dart';

class RecipeProvider extends ChangeNotifier {
  final FirebaseRecipeRepository _repo = FirebaseRecipeRepository();

  List<RecipeData> _recipes = [];
  bool _isLoading = false;

  List<RecipeData> get recipes => _recipes;
  bool get isLoading => _isLoading;

  RecipeProvider() {
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    _isLoading = true;
    notifyListeners();
    _recipes = await _repo.getRecipes();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addRecipe(RecipeData recipe) async {
    await _repo.addRecipe(recipe);
    await loadRecipes();
  }

  Future<void> deleteRecipe(String id) async {
    await _repo.deleteRecipe(id);
    await loadRecipes();
  }
}
