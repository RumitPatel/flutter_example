import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/routes/state_test/state_test.dart';
import 'package:get/get.dart';

import '../../utilities/app_utils.dart';

class MyController extends GetxController {
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

  var tasks = <Task>[
    Task(id: 1, label: "Load rocket with supplies"),
    Task(id: 2, label: "Launch rocket"),
    Task(id: 3, label: "Circle the home planet"),
    Task(id: 4, label: "Head out to the first moon"),
    Task(id: 5, label: "Launch moon lander #1"),
  ].obs;

/*  void add(Task task) {
    state = [...state, task];
  }*/

  void toggleTaskChecked(int taskId) {
    printI('before toggle');
    printTasks();

    for (var i = 0; i < tasks.length; i++) {
      var item = tasks[i];
      if (taskId == item.id) {
        tasks[i] = item.copyWith(completed: !item.completed);
      }
    }

    printI('after toggle');
    printTasks();
  }

  printTasks() {
    for (final item in tasks) {
      printI(
          'id:${item.id}, label:${item.label}, completed:${item.completed},');
    }
  }

  getCheckedTasks() {
    var numCompletedTasks = tasks.where((task) {
      return task.completed == true;
    }).length;

    return numCompletedTasks;
  }
}
