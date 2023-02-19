import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

isValidEmail(String value) {
  return !RegExp(r'\S+@\S+\.\S+').hasMatch(value);
}

navigateTo(BuildContext context, routeToBeNavigated) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => routeToBeNavigated),
  );
}
