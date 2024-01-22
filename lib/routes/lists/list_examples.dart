import 'package:android_flutter_examle/routes/lists/horizontal_container.dart';
import 'package:android_flutter_examle/routes/lists/sliver_list_route.dart';
import 'package:android_flutter_examle/utilities/app_utils.dart';
import 'package:flutter/material.dart';

import '../../list_items/main_menu_list_item.dart';

class ListExamples extends StatelessWidget {
  const ListExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List types examples"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: getListTypes().length,
          itemBuilder: (context, index) {
            var listItem = getListTypes()[index];
            return InkWell(
                onTap: () {
                  _checkAndNavigate(context, index);
                },
                child: MainMenuListItem(
                    mainMenuItem: listItem, myFunction: myFunctionToPass));
          },
        ),
      ),
    );
  }

  void myFunctionToPass() {
    print('Function passed to the constructor is executed!');
  }

  void _checkAndNavigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        navigateTo(context, const HorizontalContainer());
        break;
      case 3:
        navigateTo(context, const SliverListRoute());
        break;
    }
  }
}
