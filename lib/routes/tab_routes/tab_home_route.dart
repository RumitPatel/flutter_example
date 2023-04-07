import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabHomeRoute extends StatefulWidget {
  const TabHomeRoute({super.key});

  @override
  State<TabHomeRoute> createState() => _TabHomeRoute();
}

class _TabHomeRoute extends State<TabHomeRoute> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 160.0,
          color: Colors.red,
        ),
        Container(
          width: 160.0,
          color: Colors.blue,
        ),
        Container(
          width: 160.0,
          color: Colors.green,
        ),
        Container(
          width: 160.0,
          color: Colors.yellow,
        ),
        Container(
          width: 160.0,
          color: Colors.orange,
        ),
      ],
    );
  }
}
