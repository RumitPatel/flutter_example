import 'package:android_flutter_examle/routes/state_test/state_test.dart';
import 'package:android_flutter_examle/routes/word_pair_home_route.dart';
import 'package:android_flutter_examle/utilities/app_utils.dart';
import 'package:flutter/material.dart';

import '../list_items/main_menu_list_item.dart';
import '../utilities/constants.dart';
import 'bottom_navigation_bar_tab/bottom_navigation_bar_tab.dart';
import 'lists/list_examples.dart';
import 'login_route.dart';
import 'second_route.dart';
import 'test_login_page_route.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(homeScreenTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: getMainMenuItems().length,
          itemBuilder: (context, index) {
            var mainMenuItem = getMainMenuItems()[index];
            return InkWell(
                onTap: () {
                  _checkAndNavigate(context, mainMenuItem);
                },
                child: MainMenuListItem(
                    mainMenuItem: mainMenuItem, myFunction: myFunctionToPass));
          },
        ),
      ),
    );
  }

  void myFunctionToPass() {
    print('Function passed to the constructor is executed!');
  }

  void _checkAndNavigate(BuildContext context, String mainItem) {
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
        navigateTo(context, const BottomNavigationBarTab());
        break;
      case mainItem5Text:
        navigateTo(context, const LoginRoute());
        break;
      case mainItem6Text:
        navigateTo(context, const ListExamples());
        break;
      case mainItem7Text:
        navigateTo(context, const StateTest());
        break;
    }
  }
}
