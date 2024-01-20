import 'dart:core';

import 'package:flutter/material.dart';

import 'constants.dart';

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
    context,
    MaterialPageRoute(builder: (context) => routeToBeNavigated),
  );
}

List<String> getMainMenuItems() {
  var mainItems = <String>[
    mainItem1Text,
    mainItem2Text,
    mainItem3Text,
    mainItem4Text,
    mainItem5Text,
    mainItem6Text,
    mainItem7Text,
  ];

  return mainItems;
}
