import 'package:flutter/material.dart';

class BottomNavigationBarTest extends StatelessWidget {
  const BottomNavigationBarTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottomsheet navigation test"),
      ),
      body: Text("This is body"),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          print("index=$value");
        },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Item 2", icon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
