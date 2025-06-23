void main(){
  //Aufgabe 1
  print(sum(1,2,3));

  //Aufgabe 2
  print(stringLength('ergebnis'));
  print(stringLength('der'));
  print(stringLength('funktion'));

  //Aufgabe 3
  print(vocals('Alex'));
  print(vocals('Moritz'));
  print(vocals('Waschbär'));
}

//Funktion Aufgabe 1
int sum(int a, int b, int c){
  int result = a+b+c;
  return result;
}

//Funktion Aufgabe 2
int stringLength(String word){
  int result = word.length;
  return result;
}

//Funktion Aufgabe 3
int vocals(String word){
  int quantity = 0;
  for(int i = 0; i < word.length; i++){
    if('aeiouAEIOU'.contains(word[i])){
      quantity++;
    }
  }
  return quantity;
}