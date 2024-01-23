import 'package:android_flutter_examle/routes/lists/custom_horizontal_container.dart';
import 'package:flutter/material.dart';

class HorizontalContainer extends StatelessWidget {
  const HorizontalContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Horizontal container"),
      ),
      body: const CustomHorizontalContainer(),
    );
  }
}
