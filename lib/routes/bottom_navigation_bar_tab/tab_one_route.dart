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
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(width: 160.0, color: Colors.red),
            Container(width: 160.0, color: Colors.blue),
            Container(width: 160.0, color: Colors.green),
            Container(width: 160.0, color: Colors.yellow),
            Container(width: 160.0, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
