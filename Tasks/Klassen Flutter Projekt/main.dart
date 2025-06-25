class User{
  String userName;
  String mailAdress;
  String firstName;
  String lastName;

  User(this.firstName, this.lastName, this.userName, this.mailAdress);
}

class Recipe{

String recipeName;
String recipeID;
String recipeText;
String recipeIngrediens;

Recipe(this.recipeID, this.recipeName, this.recipeText, this.recipeIngrediens);
}

class Ranking{
  int points;
  int rank;
  bool rankUp;

  Ranking(this.points, this.rank, this.rankUp);
}