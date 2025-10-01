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

  factory RecipeData.fromMap(Map<String, dynamic> map, String documentId) {
    return RecipeData(
      id: documentId,
      name: map['name'] ?? '',
      ingredients: map['ingredients'] ?? '',
      directions: map['directions'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ingredients': ingredients,
      'directions': directions,
    };
  }
}