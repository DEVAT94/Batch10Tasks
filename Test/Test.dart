/*
  Gegeben ist eine Liste von Zahlenreihen (Berichte). Jeder Bericht ist nur dann „sicher“, wenn:

- Alle Zahlen entweder streng steigen oder streng fallen(z.B. 1,2,3 ist streng steigend, 1,2,2,3 aber nicht)

- Alle Unterschiede zwischen benachbarten Zahlen mindestens 1 und höchstens 3 betragen.

Schreibe Funktionen die diese beiden Bedingungen überprüfen.

Schreibt eine Funktion die ausgibt, wie viele Berichte diese beiden Bedingungen erfüllen.

- Zusatz: Wir wollen jetzt auch Diagonale Zahlenreihen überprüfen. Z.B. 4,8,1 usw.
   Wenn diese die beiden Bedingungen erfüllen, soll die Diagonalreihe ausgegeben werden.

*/

void main() {
  List<List<int>> inputReports = [
    [7, 6, 4, 2, 1],
    [1, 2, 7, 8, 9],
    [9, 7, 6, 2, 1],
    [1, 3, 2, 4, 5],
    [8, 6, 4, 4, 1],
    [1, 3, 6, 7, 9],
  ];

  print(hasDirection(inputReports[4]));
}

void pruefen(List<List<int>> inputReports) {
  for (var i = 0; i < inputReports.length; i++) {}
}

bool hasDirection(List<int> liste) {
  bool isDirection = false;
  bool decrease = false;
  for (var i = 1; i < liste.length; i++) {
    int diff = liste[i] - liste[i - 1];

    if (diff < 0) {
      decrease = true;
    }
    if (diff >= 1 || diff <= 3) {
      isDirection = true;
    }
  }

  print(decrease);
  return isDirection;
}