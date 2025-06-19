void main(){

  String kleineZahl = 'Kleine Zahl';
  String mittlereZahl = 'Mittlere Zahl';
  String grosseZahl = 'Große Zahl';

  for(int i = 0; i<=100; i++){
      switch(i){
        case <=10 :
        print(kleineZahl + ' $i');
        case >10 && <=60 :
        print(mittlereZahl + ' $i');
        default :
        print(grosseZahl + ' $i');
      }
  }
}