import 'dart:core';

import 'package:flutter/material.dart';

const TextStyle myTextStyleBold = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

void snack(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

bool isValidEmail(String value) {
  return !RegExp(r'\S+@\S+\.\S+').hasMatch(value);
}

void navigateTo(BuildContext context, routeToBeNavigated) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => routeToBeNavigated));
}
