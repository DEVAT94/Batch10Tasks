import 'dart:io';
void main(){
List<String?> names = ['Velgrath', 'Player'];
Map<int, String> actions = {0 : 'Angriff', 1 : 'Heiltrank', 2 : 'Flüchten'};
String lineBreak = '\n--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
int dmg = 0;
int health = 0;
int lvl = 0;
bool lvlUp = false;
bool potionUsed = false;
bool defaultSwitch = false;


print('\n-------------------Text Adventure------------------\n');
print('Wilkommen ${names[1]}, bist du bereit dich ins Abenteuer zu stützen?');
print(lineBreak);
print('\nZu aller erst, gib bitte deinen Namen ein. Ich möchte dich ungern den Rest des Abenteuers ${names[1]} nennen müssen.\n');

//Name input
names[1] = stdin.readLineSync();

if(names[1] == null || names[1] == ''){
  names[1] = 'Player';
  print(lineBreak);
  print('\nNun, wenn du mir deinen Namen nicht veraten möchtest, nenne ich dich eben weiter PlAyEr ((>*_*)> lame <(*_*<))');
} else {
  print(lineBreak);
  print('\nDu heißt also ${names[1]}, interessant.');
};

print('\nIch bin "Name konnte nicht verstanden werden" aber meine Freunde nennen mich Konsolenprogramm (zumindest tut es dieser möchtegern Entwickler, der mich erschaffen hat *hust*).\n');
print(lineBreak);
print('''\nNun ${names[1]}, deine Reise beginnt hier in den Ruinen von Darnok. Genauergesagt in einer alten 
Festung die einst ein Ort der Weisheit war, nun aber von finsteren und dunklen (sehr dunklen) Mächten verdorben wurde.
Tief im Inneren der Festung lauert der Schattenfürst ${names[0]}, ein uraltes Monster, das aus reiner Dunkelheit besteht. 
Er wurde durch einen verbotenen Zauber erschaffen und nährt sich von der Angst der Eindringlinge. 
Dein Ziel ist klar: Finde ${names[0]}, stelle dich ihm im Kampf und befreie die Festung von seinem Fluch.\n''');
print(lineBreak);
print('\nBist du bereit zu sterben? Ehhh Ich meine, dein Abenteuer zu starten?');

//Start adventure
do {
    switch (stdin.readLineSync()) {
      case 'Ja':
        print('So sei es!');
        defaultSwitch = true;
      break;
    case 'Nein' :
        print('Darnok ist dem Untergang geweiht!');
        defaultSwitch = true;
        exit(0);
    default:
        print('Mh, ich kann deinen Akzent nicht verstehen. Probiere es mit "Ja" oder "Nein".');
    }   
  } while (defaultSwitch == false);


print(lineBreak);
print('\nDu betrittst die Ruinen. ${names[0]} steht voller Hass vor dir und greift dich an.');
print(lineBreak);
print('\nWas tust du?');

}