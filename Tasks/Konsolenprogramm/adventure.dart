import 'dart:io';
import 'dart:math';
void main(){
List<String?> names = ['Velgrath', 'Player'];
String whiteText = '\x1B[0m';
String redText = '\x1B[31m';
String greenText = '\x1B[32m';
String yellowText = '\x1B[33m';
String blueText = '\x1B[34m';
String magentaText = '\x1B[35m';
String lineBreak = '$magentaText\n--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------$whiteText\n';
String actionOptions = '\n[Angriff $blueText(1)$whiteText  -  Heiltrank $blueText(2)$whiteText  -  flüchten $blueText(3)$whiteText - Zeigt dein aktuelles Leben an $blueText(/hp)$whiteText - Spiel verlassen $blueText(/exit)$whiteText]';
int dmg = 0;
Random rnd = Random();
int bossHealth = 30;
int playerHealth = 30;
//int lvl = 0;
int potion = 3;
int healthRestored = 0;
//bool lvlUp = false;
//bool potionUsed = false;
bool defaultSwitch = false;

print('$magentaText\n-------------------------------------------------------------------${whiteText}Text Adventure${magentaText}-----------------------------------------------------------------------------------------------$whiteText\n');
print('Wilkommen $blueText${names[1]}$whiteText, bist du bereit dich ins Abenteuer zu stützen?');
print(lineBreak);
print('Zu aller erst gib bitte deinen Namen ein. Ich möchte dich ungern den Rest des Abenteuers $blueText${names[1]}$whiteText nennen müssen.\n');

//Name input
names[1] = stdin.readLineSync();

if(names[1] == null || names[1] == ''){
  names[1] = 'Player';
  print(lineBreak);
  print('Nun, wenn du mir deinen Namen nicht veraten möchtest, nenne ich dich eben weiter $blueText PlAyEr $whiteText ((>*_*)> lame <(*_*<))');
} else {
  print(lineBreak);
  print('Du heißt also $blueText${names[1]}$whiteText, interessant.');
};

print('\nIch bin "${blueText}01001011 01101111 01101110 01110011 01101111 01101100 01100101 01101110 01110000 01110010 01101111 01100111 01110010 01100001 01101101 01101101${whiteText}" aber meine Freunde nennen mich ${blueText}Konsolenprogramm$whiteText (zumindest tut es dieser Möchtegernentwickler, der mich erschaffen hat).');
print(lineBreak);
print('''Nun $blueText${names[1]}$whiteText, deine Reise beginnt hier in den ${yellowText}Ruinen von Darnok${whiteText}. Genauergesagt in einer alten 
Festung die einst ein Ort der Weisheit war, nun aber von finsteren und dunklen (sehr dunklen) Mächten verdorben wurde.
Tief im Inneren der Festung lauert der Schattenfürst $blueText${names[0]}$whiteText, ein uraltes Monster, das aus reiner Dunkelheit besteht. 
Er wurde durch einen verbotenen Zauber erschaffen und nährt sich von der Angst der Eindringlinge. 
Dein Ziel ist klar: Finde $blueText${names[0]}$whiteText, stelle dich ihm im Kampf und befreie die Festung von seinem Fluch.''');
print(lineBreak);
print('Bist du bereit zu sterben? Ehhh Ich meine, dein Abenteuer zu starten?\n');

//Start adventure
do {
    switch (stdin.readLineSync()) {
      case 'Ja':
        print('\nSo sei es!');
        defaultSwitch = true;
      break;
    case 'Nein' :
        print(lineBreak);
        print('${redText}Darnok ist dem Untergang geweiht!');
        defaultSwitch == true;
        exit(0);
    default:
        print('\nMh, ich kann deinen Akzent nicht verstehen. Probiere es mit "${blueText}Ja${whiteText}" oder "${blueText}Nein${whiteText}".\n');
    }   
  } while (defaultSwitch == false);

//Encounter
print(lineBreak);
print('Du betrittst die Ruinen. $blueText${names[0]}$whiteText steht voller Hass vor dir und greift dich an.');
print(lineBreak);
print('Was tust du?');
print(actionOptions);
print(lineBreak);

//Boss fight
defaultSwitch = false;

do{
  switch (stdin.readLineSync()){
    case '1' :
      print(lineBreak);
      print('Du greifst an!\n');

      dmg = rnd.nextInt(10);
      bossHealth = bossHealth - dmg;

      print('$blueText${names[0]}$whiteText erleidet $redText$dmg$whiteText Schaden.\n');

      if(bossHealth <= 0){
        print('$greenText${names[0]} wurde vernichtet!$whiteText');
        print(lineBreak);
        print('Herzlichen Glückwunsch Kleiner, du hast die Welt gerettet. Der Name $blueText${names[1]}$whiteText soll von nun an, jedem auf der Welt bekannt sein!');
        defaultSwitch = true;
      } else {
        dmg = rnd.nextInt(10);
        playerHealth = playerHealth - dmg;
        print('$blueText${names[0]}$whiteText setzt zum Gegenschlag an. Du erleidest $redText$dmg$whiteText Schaden!');
        print(lineBreak);

          if(playerHealth <= 0){
            print('${redText}Game over$whiteText Sportsfreund. Die Welt ist verdammt! $blueText${names[0]}$whiteText wird alles und jeden vernichten! Muhaha');
          } else {
            print('Was tust du?');
            print(actionOptions);
            print(lineBreak);
          }
      }

      if(playerHealth <= 0){defaultSwitch = true;}
      
    case '2' : 
      healthRestored = rnd.nextInt(15) + 2;
      playerHealth = playerHealth + healthRestored;

      if(playerHealth >= 30){
          playerHealth = 30;
      }
      print(lineBreak);
      print('Du trinkst einen Heiltrank! Du hast $greenText$healthRestored$whiteText Lebenspunkte wiederhergestellt. Du hast $greenText$playerHealth$whiteText Leben! Du hast noch $greenText${--potion}$whiteText verfügbar\n');

      dmg = rnd.nextInt(10);
      playerHealth = playerHealth - dmg;

      print('$blueText${names[0]}$whiteText setzt zum Gegenschlag an. Du erleidest $redText$dmg$whiteText Schaden!\n');
      print('\nWas tust du?');
      print(actionOptions);
      print(lineBreak);

      if(playerHealth <= 0){defaultSwitch = true;};
    case '3' :
      print('\nWas tust du?');
      print(actionOptions);
      print(lineBreak);
      print('Du flüchtest!');
      print('${redText}Darnok ist dem Untergang geweiht!');
      print(lineBreak);
      defaultSwitch = true;
    case '/hp' :
      print('\n$greenText>>${playerHealth}<<$whiteText');
      print('\nWas tust du?');
      print(actionOptions);
      print(lineBreak);
    case '/exit' :
      print(lineBreak);
      print('${redText}Darnok ist dem Untergang geweiht!');
      print(lineBreak);
      defaultSwitch = true;
      exit(0);
    default :
      print('\nUngültige Eingabe\n\nMögliche Optionen sind:\n${actionOptions}\n');
      print(lineBreak);
      print('\nWas tust du?');
      print(actionOptions);
      print(lineBreak);
    
  }
}while(defaultSwitch == false && bossHealth >= 0 || defaultSwitch == false && playerHealth >= 0);

print(lineBreak);

}