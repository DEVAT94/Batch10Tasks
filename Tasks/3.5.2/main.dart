void main(){
//Aufgabe 1
printNumber(1);
printNumber(2);
printNumber(3);

//Aufgabe 2
triplePrint('a');
triplePrint('b');
triplePrint('c');

//Aufgabe 3
reverseInitials('Johnny', 'Depp');
reverseInitials('Tom', 'Cruise');
}

//Funktion Aufgabe 1
void printNumber(int number){
  print(number);
}

//Funktion Aufgabe 2
void triplePrint(String text){
  print(text);
}

//Funktion Aufgabe 3
void reverseInitials(String firstName, String lastName){
  print('${firstName.substring(firstName.length - 1).toUpperCase()}. ${lastName.substring(lastName.length - 1).toUpperCase()}.');
}