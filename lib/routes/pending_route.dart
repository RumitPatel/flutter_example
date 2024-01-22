import 'package:flutter/material.dart';

class PendingRoute extends StatelessWidget {
  const PendingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pending Page"),
      ),
      body: const Center(child: Text('This is a pending page')),
    );
  }
}
