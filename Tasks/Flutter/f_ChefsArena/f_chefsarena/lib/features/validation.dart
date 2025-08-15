import 'package:flutter/material.dart';

String? validateEmail(value) {
  if (value == ' ' ||
      !value.toString().contains('@') ||
      !value.toString().contains('.')) {
    return 'Die Email Adresse hat kein gültiges Format';
  }
  return null;
}

// Beispiel der Verwendung der Funktion im UI
// ignore: non_constant_identifier_names
Widget emailTextFormField() {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Email',
    ),
    validator: validateEmail,
  );
}

String? validatePassword(value) {
  if (value.toString().isEmpty ||
      !value.toString().contains('Sonderzeichen über RegEx')) {
    return 'Das Password entspricht nicht den Anforderungen';
  }
  return null;
}

// Beispiel der Verwendung der Funktion im UI
// ignore: non_constant_identifier_names
Widget passwordTextFormField() {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Password',
    ),
    validator: validateEmail,
  );
}

String? validateUsername(value) {
  if (value.toString().isEmpty ||
      value.toString().contains('Sonderzeichen über Regex')) {
    return 'Der Name hat kein gültiges Format';
  } else if (value.toString() ==
      value.toString() /*Vergleich mit den Einträgen aus der DB*/ ) {}
  return null;
}

// Beispiel der Verwendung der Funktion im UI
// ignore: non_constant_identifier_names
Widget usernameTextFormField() {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Username',
    ),
    validator: validateEmail,
  );
}