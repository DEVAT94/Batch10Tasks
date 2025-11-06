class RecipeData {
  final String id;
  final String recipeName;
  final String ingredients;
  final String preparation;
  final String? recipePicture;

  RecipeData({
    required this.id,
    required this.recipeName,
    required this.ingredients,
    required this.preparation,
    this.recipePicture,
  });

  factory RecipeData.fromMap(Map<String, dynamic> map, String documentId) {
    return RecipeData(
      id: documentId,
      recipeName: map['recipeName'] ?? '',
      ingredients: map['ingredients'] ?? '',
      preparation: map['preparation'] ?? '',
      recipePicture: map['recipePicture'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recipeName': recipeName,
      'ingredients': ingredients,
      'preparation': preparation,
      'recipePicture': recipePicture,
    };
  }
}