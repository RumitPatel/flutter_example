import 'package:flutter/cupertino.dart';

class TabHomeRoute extends StatefulWidget {
  const TabHomeRoute({super.key});

  @override
  State<TabHomeRoute> createState() => _TabHomeRoute();
}

class _TabHomeRoute extends State<TabHomeRoute> {
  @override
  Widget build(BuildContext context) {
    return const Text("This is Tab home route");
  }
}
