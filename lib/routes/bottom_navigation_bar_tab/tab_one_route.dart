import 'package:flutter/material.dart';

class TabOneRoute extends StatefulWidget {
  const TabOneRoute({super.key});

  @override
  State<TabOneRoute> createState() => _TabOneRoute();
}

class _TabOneRoute extends State<TabOneRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal ListView'),
      ),
      body: Center(child: const Text("This is a horizontal listview")),
    );
  }
}
