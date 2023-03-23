
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabRoute extends StatelessWidget {
  const TabRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab route title'),
      ),
      body: Center(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label: "Item 1", icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            label: "Item 2", icon: Icon(Icons.shopping_cart)),
        BottomNavigationBarItem(
            label: "Settings", icon: Icon(Icons.settings)),
      ],),
    );
  }
}