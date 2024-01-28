import 'package:flutter/material.dart';
import 'package:flutter_example/routes/home_route.dart';
import 'package:flutter_example/utilities/constants.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const HomeRoute(),
      // ),
    );
  }
}
