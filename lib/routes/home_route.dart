import 'package:android_flutter_examle/routes/wordpairpage/word_pair_home_route.dart';
import 'package:android_flutter_examle/utilities/app_utils.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'login_page_test.dart';
import 'login_route.dart';
import 'second_route.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var mainItems = <String>[
      mainItem1Text,
      mainItem2Text,
      mainItem3Text,
      mainItem4Text
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
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
        navigateTo(context, const LoginPageTest());
        break;
      case mainItem4Text:
        navigateTo(context, const LoginRoute());
        break;
    }
  }
}
