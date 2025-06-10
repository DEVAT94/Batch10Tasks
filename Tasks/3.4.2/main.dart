void main(){
  int age = 15;
  bool hasParentalConsent = true;
  int movieAgeRating = 16;
  
  if(age >= movieAgeRating || hasParentalConsent && age >= movieAgeRating - 2){
    print(true);
    //print(age);
    //print(movieAgeRating - 2);
  
  }
  else {
    print(false);
    //print(age);
    //print(movieAgeRating);
  }
    
}