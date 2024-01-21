import 'package:flutter/material.dart';

class CustomHorizontalContainer extends StatelessWidget {
  const CustomHorizontalContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(width: 180.0, color: Colors.red),
          Container(width: 180.0, color: Colors.blue),
          Container(width: 180.0, color: Colors.green),
          Container(width: 180.0, color: Colors.yellow),
          Container(width: 180.0, color: Colors.orange),
          Container(width: 180.0, color: Colors.greenAccent),
        ],
      ),
    );
  }
}
