class RecipeData {
  final String id;
  final String name;
  final String ingredients;
  final String directions;

  RecipeData({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.directions,
  });

  RecipeData copyWith({
    String? id,
    String? name,
    String? ingredients,
    String? directions,
  }) {
    return RecipeData(
      id: id ?? this.id,
      name: name ?? this.name,
      ingredients: ingredients ?? this.ingredients,
      directions: directions ?? this.directions,
    );
  }
}