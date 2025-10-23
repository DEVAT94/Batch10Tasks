import 'package:f_chefsarena/data/recipedata.dart';
import 'package:f_chefsarena/screens/Recipes/recipeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    if (recipeProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final recipes = recipeProvider.recipes;

    return Scaffold(
      appBar: AppBar(title: const Text("Rezepte")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          recipeProvider.addRecipe(
            RecipeData(
              id: "",
              recipeName: "Nudelsalat",
              ingredients: "Nudeln, Mayo, Erbsen",
              preparation: "Alles mischen und kühlen.",
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: recipes.isEmpty
          ? const Center(child: Text("Keine Rezepte vorhanden"))
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return ListTile(
                  title: Text(recipe.recipeName),
                  subtitle: Text(recipe.ingredients),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      recipeProvider.deleteRecipe(recipe.id);
                    },
                  ),
                );
              },
            ),
    );
  }
}