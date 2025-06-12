enum Weekday {monday,tuesday,wednesday,thursday,friday,saturday,sunday}

void main(){
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
}