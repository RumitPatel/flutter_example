import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenuListItem extends StatelessWidget {
  String mainMenuItem;
  final Function myFunction;

  MainMenuListItem({
    super.key,
    required this.mainMenuItem,
    required this.myFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 80.0,
          width: 80.0,
          child: Icon(Icons.arrow_forward),
        ),
        Text(mainMenuItem)
      ],
    );
  }
}
