abstract class DatabaseRepository{
  void recipe(Get,Set);
  void saveRecipe(String recipeName, String recipe, String ingrediens);
  void level(Get, Set);
  void getExperience();
  void topic(Get, Set);
  void rating();
}

class MockDatabaseRepository implements DatabaseRepository{
  @override
  void recipe(Get, Set) {
    // TODO: implement recipe
  }
  @override
  void saveRecipe(String recipeName, String recipe, String ingrediens) {
    // TODO: implement saveRecipe
  }
  @override
  void level(Get, Set) {
    // TODO: implement level
  }
  @override
  void getExperience() {
    // TODO: implement getExperience
  }
  @override
  void topic(Get, Set) {
    // TODO: implement topic
  }
  @override
  void rating() {
    // TODO: implement rating
  }
  
}

