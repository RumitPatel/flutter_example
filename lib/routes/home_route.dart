import 'package:android_flutter_examle/routes/tab_routes/tab_route.dart';
import 'package:android_flutter_examle/routes/word_pair_home_route.dart';
import 'package:android_flutter_examle/utilities/app_utils.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'login_route.dart';
import 'second_route.dart';
import 'test_login_page_route.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var mainItems = <String>[
      mainItem1Text,
      mainItem2Text,
      mainItem3Text,
      mainItem4Text,
      mainItem5Text
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(homeScreenTitle),
      ),
      body: Center(
        child: ListView(
          children: [
            for (var mainItem in mainItems)
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    checkAndNavigate(context, mainItem);
                  },
                ),
                title: TextButton(
                  onPressed: () {
                    checkAndNavigate(context, mainItem);
                  },
                  child: Text(mainItem),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          print("index=$value");
        },
        items: [
          BottomNavigationBarItem(label: "Item 1", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Item 2", icon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }

  void checkAndNavigate(BuildContext context, String mainItem) {
    switch (mainItem) {
      case mainItem1Text:
        navigateTo(context, const WordPairRoute());
        break;
      case mainItem2Text:
        navigateTo(context, const SecondRoute());
        break;
      case mainItem3Text:
        navigateTo(context, const TestLoginPageRoute());
        break;
      case mainItem4Text:
        navigateTo(context, const TabRoute());
        break;
      case mainItem5Text:
        navigateTo(context, const LoginRoute());
        break;
    }
  }
}
