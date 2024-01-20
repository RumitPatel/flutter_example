import 'package:flutter/material.dart';

class TabTwoRoute extends StatefulWidget {
  const TabTwoRoute({super.key});

  @override
  State<TabTwoRoute> createState() => _TabTwoRoute();
}

class _TabTwoRoute extends State<TabTwoRoute> {
  @override
  Widget build(BuildContext context) {
    const title = 'This is tab Two route';
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Text(title),
    );
  }
}
