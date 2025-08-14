import 'package:f_chefsarena/data/recipedata.dart';

abstract class DatabaseRepository{
  
  List<RecipeData> get recipes;

  RecipeData? byId(String id);

  RecipeData create(RecipeData draft);

  void update(RecipeData updated);

  void delete(String id);
}