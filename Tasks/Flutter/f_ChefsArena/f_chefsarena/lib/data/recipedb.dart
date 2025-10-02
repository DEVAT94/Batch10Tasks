import 'package:f_chefsarena/data/database_repo.dart';
import 'package:f_chefsarena/data/recipedata.dart';
import 'package:flutter/material.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  final FirebaseRecipeRepository db = FirebaseRecipeRepository();

  @override
  void initState() {
    super.initState();
    db.addRecipe(
      RecipeData(
        id: "",
        recipeName: "Nudelsalat",
        ingredients: "Nudeln, Mayo, Erbsen",
        preparation: "Alles mischen und kühlen.",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Rezepte")),
        body: FutureBuilder<List<RecipeData>>(
          future: db.getRecipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Fehler: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("Keine Rezepte vorhanden"));
            }
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return ListTile(
                  title: Text(recipe.recipeName),
                  subtitle: Text(recipe.ingredients),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await db.deleteRecipe(recipe.id);
                      setState(() {});
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}