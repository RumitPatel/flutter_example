import 'package:android_flutter_examle/screens/wordpairpage/WordPairHomePage.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'SecondRoute.dart';

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
                    // appState.removeFavorite(pair);
                    if (mainItem == mainItem1Text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WordPairHomePage()),
                      );
                    } else if (mainItem == mainItem2Text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
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
