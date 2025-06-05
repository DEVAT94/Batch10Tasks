import "dart:io";

void main() {
  // Reiseroute mit Distanzen
  Map<String, int> reiseroute = {"Max": 120, "Peter": 90, "Anna": 270};

  // Geschwindigekeit fest
  //int geschwindigkeit = 90; // km/h

  //Eingabe der Geschwindigkeit
  print("Bitte gib die Geschwindigkeit in km/h ein:");
  String? eingabe = stdin.readLineSync();
  int geschwindigkeit = int.parse(eingabe ?? "90");

  //Fahrzeitberechnung
  double zeitMax = reiseroute["Max"]! / geschwindigkeit; // Zeit für Max
  double zeitPeter = reiseroute["Peter"]! / geschwindigkeit; // Zeit für Peter
  double zeitAnna = reiseroute["Anna"]! / geschwindigkeit; // Zeit für Anna

  //Gesamtdistanz und Fahrzeit
  int gesamtKm = reiseroute["Max"]! +
      reiseroute["Peter"]! +
      reiseroute["Anna"]!; // Gesamtdistanz
  double gesamtZeit = zeitMax + zeitPeter + zeitAnna;
  //Ausgabe der Ergebnisse
  print("Deine Reiseroute bei $geschwindigkeit km/h:");
  print("1. Max: ${reiseroute["Max"]} km, Zeit: ${zeitMax} Stunden");
  print(
      "2. Peter: ${reiseroute["Peter"]} km, Zeit: ${zeitPeter.toStringAsFixed(2)} Stunden");
  print(
      "3. Anna: ${reiseroute["Anna"]} km, Zeit: ${zeitAnna.toStringAsFixed(2)} Stunden");
  print("Gesamtdistanz: $gesamtKm km");
  print("Gesamtfahrzeit: ${gesamtZeit.toStringAsFixed(2)} Stunden");
}