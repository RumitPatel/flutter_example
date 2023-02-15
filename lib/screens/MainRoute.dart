import 'package:android_flutter_examle/screens/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'SecondRoute.dart';

class MainRoute extends StatelessWidget {
  const MainRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var mainItems = appState.mainItems;

    /*return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Main List'),
        ),
        for (var mainItem in mainItems)
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
              onPressed: () {
                // appState.removeFavorite(pair);
              },
            ),
            title: Text(mainItem),
          ),
      ],
    );*/

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
                  icon: Icon(Icons.arrow_forward, semanticLabel: 'Selection arrow'),
                  onPressed: () {
                    // appState.removeFavorite(pair);
                    if(mainItem == 'List Item One') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    } else if(mainItem == 'List Item Two') {
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
