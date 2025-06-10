void main(){

  //Aufgabe 1
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

  //Aufgabe 2
  bool isLoggedIn = true;
  bool isBanned = false;
  bool isSubscripted = true;
  int age = 18;
  
  if(!isLoggedIn){
    print("Bitte logge dich ein"); 
  }
  
  if(isBanned == true){
    print("Dein Account wurde gesperrt");
  }
  
  if(!isSubscripted){
    print("Bitte aboniere");
  }
  
  if(age < 18){
    print("Du bist zu jung");
  }
  else{
    print("Willkommen");
  }
}