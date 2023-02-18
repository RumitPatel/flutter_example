import 'package:android_flutter_examle/screens/my_custom_form.dart';
import 'package:android_flutter_examle/screens/wordpairpage/WordPairHomePage.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'second_route.dart';

class MainRoute extends StatelessWidget {
  const MainRoute({super.key});

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
                              builder: (context) => WordPairHomePage()),
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
                              builder: (context) => MyCustomForm()),
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
