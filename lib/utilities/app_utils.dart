import 'dart:core';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void printI(String message) {
  const String mTag = "####";
  if (kDebugMode) {
    print('$mTag $message');
  }
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

void showSnackBottom(title, message) {
  Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
}
