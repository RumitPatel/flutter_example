import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/app_utils.dart';

class MyController extends GetxController {
  var count = 0.obs;

  increment() => {count.value = getRandomInt()};

  var current = WordPair.random().obs;
  var history = <WordPair>[].obs;

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current.value);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);

    current = WordPair.random().obs;
    // notifyListeners();
  }

  var favourites = <WordPair>[].obs;

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current.value;
    printI('pair for toggle: $pair');
    printFavourites();
    if (favourites.contains(pair)) {
      printI('going to remove from favourite');
      favourites.remove(pair);
    } else {
      printI('going to add to favourite');
      favourites.add(pair);
    }
    // notifyListeners();
  }

  void removeFavorite(WordPair value) {
    if (favourites.contains(value)) {
      favourites.remove(value);
    }

    // notifyListeners();
  }

  void printFavourites() {
    printI('going to print all favourites. length: ${favourites.length}');
    for (var i = 0; i < favourites.length; i++) {
      printI('${favourites[i]}');
    }
  }

  getFavouriteIcon() {
    IconData icon;
    if (favourites.contains(current.value)) {
      return Icons.favorite;
    } else {
      return Icons.favorite_border;
    }
  }
}
