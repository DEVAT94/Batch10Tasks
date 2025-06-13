void main(){
  
print('Aufgabe 1');

 //Aufgabe 1
 List<int> points = [4, 5, 4, 2, 6, 6, 3];
 List<String> names = ['Julietta', 'Benjamino', 'Hans-Günther', 'Evalinea', 'Fiona', 'Gregory', 'Leonhart'];
 
 int i = 1;
  
 for(String n in names) {
   print('Name ${i++}: $n');
 }
  
print('\n_________________________________________________________________\n\nAufgabe 2');  
  
  //Aufgabe 2
  double sum = 0.0;
  int durchschnitt = points.length;
  
  for(int i in points){
    sum += i;
  }

  print('Die Summer der Liste $points, beträgt: $sum');
  print('Der Durchschnitt der Liste $points, beträgt: ${sum / durchschnitt}');
}