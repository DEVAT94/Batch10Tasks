enum Weekday {monday,tuesday,wednesday,thursday,friday,saturday,sunday}

void main(){
  //TEEEEEST .ignore

  //Aufgabe 1
  Weekday? weekday;
  
  weekday = Weekday.monday;
  
  switch(weekday){
      case(Weekday.monday || Weekday.tuesday) :
        print('Montage und Dienstage sind anstrengend');
      case(Weekday.wednesday || Weekday.thursday) :
        print('Mittwoch und Donnerstag sind ok');
      case(Weekday.friday) :
        print('Freitag ist super');
      case(Weekday.saturday || Weekday.sunday) :
        print('Wochenende ist genial');
      default :
        print('Kein Tag ausgewählt');
  };

  //Aufgabe 2
  String sex = 'female';
  int age = 20;
  
  switch (sex) {
   case 'male':
     switch (age) {
       case >= 20 && <= 25:
         print("Im Schnitt 181,4m");
       case >= 25 && <= 30:
         print("Im Schnitt 181,3m");
       case >= 30 && <= 35:
         print("Im Schnitt 180,4m");
       default :
         print('Keine Größe zuordbar');
     }
   case 'female':
     switch (age) {
       case >= 20 && <= 25:
         print("Im Schnitt 167,5m");
       case >= 25 && <= 30:
         print("Im Schnitt 167,3 m");
       case >= 30 && <= 35:
         print("Im Schnitt 167,2");
       default :
         print('Keine Größe zuordbar');
     }
 }
}