//Aufgabe 3
void main() {
  Rectangle a = Rectangle(edgeLengthX: 14, edgeLengthY: 2);

  print("Umfang: ${a.size()}");
  print("Fläche: ${a.area()}");
}

class Rectangle{
  double edgeLengthX;
  double edgeLengthY;
  
  Rectangle({
    required this.edgeLengthX,
    required this.edgeLengthY
  });
  
  double size(){
    
    var result = 2 * edgeLengthX + 2 * edgeLengthY;
    
    return result;
    
  }
  
  double area(){
    
    var result = edgeLengthX * edgeLengthY;
    
    return result;
    
  }
}