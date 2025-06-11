void main(){
  
  //Erstellung der Liste vom Typ Map
  List<Map<String, double?>> weatherData=
    [{'temp': 5.3, 'rain': 0.9, 'wind': null},
    {'temp': 4.5, 'rain': null, 'wind': 16.8},
    {'temp': null, 'rain': 3.8, 'wind': null}];
  
  //Initialisierung der Listen
  List<double?> temps = [];
  List<double?> rains = [];
  List<double?> winds = [];
  
  //List.add(Temperatur)
  temps.add(weatherData[0]['temp'] ?? 0);
  temps.add(weatherData[1]['temp'] ?? 0);
  temps.add(weatherData[2]['temp'] ?? 0);
  
  //List.add(Regen)
  rains.add(weatherData[0]['rain'] ?? 0);
  rains.add(weatherData[1]['rain'] ?? 0);
  rains.add(weatherData[2]['rain'] ?? 0);
  
  //List.add(Wind)
  winds.add(weatherData[0]['wind'] ?? 0);
  winds.add(weatherData[1]['wind'] ?? 0);
  winds.add(weatherData[2]['wind'] ?? 0);

  //Berechnung und Zuweisung der Ergebnisse
  double? avgTemp = (temps[0]! + temps[1]! + temps[2]!) / 3;
  double? avgRain = (rains[0]! + rains[1]! + rains[2]!) / 3;
  double? avgWind = (winds[0]! + winds[1]! + winds[2]!) / 3;
  
  //Ausgabe der Werte
  print('''
  Durchschnittstemperatur: $avgTemp
  Niederschlagsmenge: $avgRain 
  Windgeschwindigkeit: $avgWind''');
  
  //Aufgabe 1 Bonus
  double? x = weatherData[2]['temp'] ?? weatherData[0]['wind'] ?? 
    ((4.5 >= (weatherData[1]['temp'] ?? 0)) ? 
     weatherData[1]['temp'] : weatherData[1]['wind']);
  
  print(x);
 
}