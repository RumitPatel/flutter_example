import 'package:android_flutter_examle/screens/wordpairpage/WordPairHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../utilities/constants.dart';
import 'SecondRoute.dart';

class MainRoute extends StatelessWidget {
  const MainRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var mainItems2 = <String>[mainItem1Text, mainItem2Text];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: ListView(
          children: [
            for (var mainItem in mainItems2)
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
