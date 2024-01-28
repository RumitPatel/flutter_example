import 'package:flutter_example/models/list_header_item.dart';
import 'package:flutter/material.dart';

class SingleChildScrollViewRoute extends StatelessWidget {
  const SingleChildScrollViewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < 25; i++)
              ListHeaderItem('Item ${i + 1}', null).getItemWidget(context)
          ],
        ),
      ),
    );
  }
}
