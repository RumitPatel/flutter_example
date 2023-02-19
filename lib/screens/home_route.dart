import 'package:android_flutter_examle/screens/login_route.dart';
import 'package:android_flutter_examle/screens/wordpairpage/word_pair_home_route.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'second_route.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var mainItems = <String>[mainItem1Text, mainItem2Text, mainItem3Text];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: ListView(
          children: [
            for (var mainItem in mainItems)
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.arrow_forward,
                      semanticLabel: 'Selection arrow'),
                  onPressed: () {
                    switch (mainItem) {
                      case mainItem1Text:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WordPairRoute()),
                        );
                        break;
                      case mainItem2Text:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondRoute()),
                        );
                        break;
                      case mainItem3Text:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginRoute()),
                        );
                        break;
                    }
                  },
                ),
                title: Text(mainItem),
              ),
          ],
        ),
      ),
    );
  }
}
