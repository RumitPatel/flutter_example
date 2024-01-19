import 'package:android_flutter_examle/routes/bottomsheet_navigation/bottomsheet_navigation.dart';
import 'package:android_flutter_examle/routes/sliverlist/sliver_list_route.dart';
import 'package:android_flutter_examle/routes/state_test/state_test.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(homeScreenTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: getMainMenuItems().length,
          itemBuilder: (context, index) {
            var mainMenuItem = getMainMenuItems()[index];
            return GestureDetector(
              onTap: (){
                _checkAndNavigate(context, mainMenuItem);
              },
                child: MainMenuListItem(mainMenuItem: mainMenuItem));
          },
        ),
      ),

    );
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
        navigateTo(context, const TabRoute());
        break;
      case mainItem5Text:
        navigateTo(context, const LoginRoute());
        break;
      case mainItem6Text:
        navigateTo(context, const SliverListRoute());
        break;
      case mainItem7Text:
        navigateTo(context, const StateTest());
        break;
      case mainItem8Text:
        navigateTo(context, const BottomSheetNavigation());
        break;
    }
  }
}

class MainMenuListItem extends StatelessWidget {
  String mainMenuItem;

  MainMenuListItem({
    super.key,
    required this.mainMenuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 80.0,
          width: 80.0,
          child: Icon(Icons.arrow_forward),
        ),
        Text(mainMenuItem)
      ],
    );
  }
}
