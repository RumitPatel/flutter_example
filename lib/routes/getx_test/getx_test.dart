import 'package:flutter/material.dart';
import 'package:flutter_example/routes/getx_test/my_controller.dart';
import 'package:get/get.dart';

class GetXTest extends StatelessWidget {
  const GetXTest({super.key});

  @override
  Widget build(BuildContext context) {
    MyController myController = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Test Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('data ${myController.count.value}')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.update),
        onPressed: () {
          updateValues();
        },
      ),
    );
  }

  void updateValues() {
    MyController myController = Get.find<MyController>();
    myController.increment();
  }
}
