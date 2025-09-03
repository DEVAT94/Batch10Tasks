import 'package:f_chefsarena/data/ingredients.dart';
import 'package:f_chefsarena/data/recipedata.dart';

class Recipedb {
  final List<RecipeData> _recipes = [
    RecipeData(
      id: '1',
      name: 'Nudelsalat',
      ingredients: Ingredients().nudelsalatRecipe(),
      directions: Directions().nudelsalatDirection(),
    ),
    RecipeData(
      id: '2',
      name: 'Nudelsalat',
      ingredients: Ingredients().nudelsalatRecipe(),
      directions: Directions().nudelsalatDirection(),
    ),
    RecipeData(
      id: '3',
      name: 'Nudelsalat',
      ingredients: Ingredients().nudelsalatRecipe(),
      directions: Directions().nudelsalatDirection(),
    ),
  ];

  int _idCounter = 3;
  
  List<RecipeData> get items => List.unmodifiable(_recipes);

  Future<RecipeData> create(RecipeData draft) async{
    final created = draft.getRecipeData(id: (_idCounter++).toString());
    _recipes.add(await created);
    return created;
  }

  void update(RecipeData updated) {
    final i = _recipes.indexWhere((p) => p.id == updated.id);
    if (i == -1) return;
    _recipes[i] = updated;
  }

  void delete(String id) {
    _recipes.removeWhere((p) => p.id == id);
  }
}
