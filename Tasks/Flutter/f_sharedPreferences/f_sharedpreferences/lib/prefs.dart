import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? _prefs;

Future<void> initializePersistence () async {
  _prefs = await SharedPreferences.getInstance();
}

Future<bool> saveName (String name) async {

  try{
    return _prefs!.setString('name', name);
  } catch(e) {
    print('Error with saving stuff $e');
    return false;
  }
}

String loadName () {
  return _prefs?.getString('name') ?? '';
}