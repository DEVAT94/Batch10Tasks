abstract class DatabaseRepository{
  void getRecipe(Get,Set);
  void saveRecipe(String recipeName, String recipe, String ingrediens);
  void getLevel();
  void setLevel();
  void getExperience();
  void getTopic();
  void setTopic();
  void rating();
}

class MockDatabaseRepository implements DatabaseRepository{
  @override
  void getRecipe(Get, Set) {
    
  }
  @override
  void saveRecipe(String recipeName, String recipe, String ingrediens) {
    // TODO: implement saveRecipe
  }
  @override
  void getLevel() {
    // TODO: implement getLevel
  }
  @override
  void setLevel() {
    // TODO: implement setLevel
  }
  @override
  void getExperience() {
    // TODO: implement getExperience
  }
  @override
  void getTopic() {
    // TODO: implement getTopic
  }
  @override
  void setTopic() {
    // TODO: implement setTopic
  }
  @override
  void rating() {
    // TODO: implement rating
  }
  
}

