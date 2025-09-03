import 'package:f_chefsarena/data/recipedata.dart';

abstract class DatabaseRepository{
  
  Future <List<RecipeData>> get recipes;

  Future <RecipeData?> byId(String id);

  Future <RecipeData> create(RecipeData draft);

  Future <void> update(RecipeData updated);

  Future <void> delete(String id);
}