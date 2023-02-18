import 'package:android_flutter_examle/screens/main_route.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        ),
        // home: MyHomePage(),
        home: MainRoute(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);

    current = WordPair.random();
    notifyListeners();
  }

  var favourites = <WordPair>[];

  /*void toggleFavorite() {
    if (favourites.contains(current)) {
      favourites.remove(current);
    } else {
      favourites.add(current);
    }
    notifyListeners();
  }*/

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favourites.contains(pair)) {
      favourites.remove(pair);
    } else {
      favourites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair value) {
    if (favourites.contains(value)) {
      favourites.remove(value);
    }

    notifyListeners();
  }
}
