import 'package:flutter/material.dart';
import 'package:flutter_example/routes/home_page/home_controller.dart';
import 'package:flutter_example/utilities/app_utils.dart';
import 'package:get/get.dart';

import '../../utilities/constants.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController c = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(homeScreenTitle),
      ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                    controller: c.queryController.value,
                    decoration: const InputDecoration(
                      hintText: 'Search content',
                      border: InputBorder.none,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: c.onSearchTextChanged,
                  ),
                  trailing: c.queryController.value.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            c.clearQueryController();
                            c.onSearchTextChanged('');
                          },
                        )
                      : const SizedBox(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: c.getCurrentOptions().length,
                itemBuilder: (context, index) {
                  final item = c.getCurrentOptions()[index];
                  return InkWell(
                      onTap: () {
                        navigateTo(context, item.getWidgetToNavigate(context));
                      },
                      child: item.getItemWidget(context));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
