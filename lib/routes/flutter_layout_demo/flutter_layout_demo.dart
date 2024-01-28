import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class FlutterLayoutDemo extends StatelessWidget {
  const FlutterLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Flutter layout demo.'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ImageSection(image: 'images/lake.jpg'),
            TitleSection(),
            ButtonSection(),
            TextSection(),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Oeschinen Lake Campground",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Kandersteg, Switzerland",
                    style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(
          optionIcon: Icons.call,
          optionColor: color,
          optionName: "CALL",
        ),
        ButtonWithText(
          optionIcon: Icons.near_me,
          optionColor: color,
          optionName: "ROUTE",
        ),
        ButtonWithText(
          optionIcon: Icons.share,
          optionColor: color,
          optionName: "SHARE",
        ),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.optionIcon,
    required this.optionColor,
    required this.optionName,
  });

  final IconData optionIcon;
  final Color optionColor;
  final String optionName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(optionIcon, color: optionColor),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            optionName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: optionColor,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        lorumIpsum1,
        softWrap: true,
      ),
    );
  }
}
