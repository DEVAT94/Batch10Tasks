import 'package:flutter/material.dart';

String? validateEmail(value) {
  if (value == ' ' ||
      !value.toString().contains('@') ||
      !value.toString().contains('.')) {
    return 'Die Email Adresse hat kein gültiges Format';
  }
  return null;
}

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
      value.toString()) {}
  return null;
}

Widget usernameTextFormField() {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Username',
    ),
    validator: validateEmail,
  );
}