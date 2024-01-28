import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';


void printI(String message) {
  const String m_tag = "####";

  print('$m_tag $message');
}

void snack(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

bool isValidEmail(String value) {
  return !RegExp(r'\S+@\S+\.\S+').hasMatch(value);
}

void navigateTo(context, routeToBeNavigated) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => routeToBeNavigated));
}

int getRandomInt() {
  return Random().nextInt(90);
}
