import 'dart:core';

import 'package:flutter/material.dart';

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
