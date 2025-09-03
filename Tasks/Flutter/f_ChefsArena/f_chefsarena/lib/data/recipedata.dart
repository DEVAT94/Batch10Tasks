class RecipeData {
  final String id;
  final String name;
  final String ingredients;
  final String directions;

  const RecipeData({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.directions,
  });

  Future<RecipeData> getRecipeData({
    String? id,
    String? name,
    String? ingredients,
    String? directions,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return RecipeData(
      id: id ?? this.id,
      name: name ?? this.name,
      ingredients: ingredients ?? this.ingredients,
      directions: directions ?? this.directions,
    );
  }

  static Future<RecipeData> empty() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const RecipeData(id: '', name: '', ingredients: '', directions: '');
  }
}
