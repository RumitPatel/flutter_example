import 'package:flutter_example/models/list_header_item.dart';
import 'package:flutter/material.dart';

class ListViewExampleRoute extends StatelessWidget {
  const ListViewExampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView example'),
      ),
      body: ListView.builder(
          itemCount: 21,
          itemBuilder: (BuildContext context, int index) {
            return ListHeaderItem('Item ${index + 1} ', null)
                .getItemWidget(context);
          }),
    );
  }
}
