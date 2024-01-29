import 'package:flutter/material.dart';
import 'package:flutter_example/routes/empty_page.dart';
import 'package:flutter_example/routes/flutter_layout_demo/flutter_layout_demo.dart';
import 'package:flutter_example/routes/getx_test/getx_test.dart';
import 'package:flutter_example/routes/lists/listview_example_route.dart';
import 'package:flutter_example/utilities/app_utils.dart';

import '../models/list_header_item.dart';
import '../models/list_message_item.dart';
import '../models/main_list_item.dart';
import '../utilities/constants.dart';
import 'bottom_navigation_bar_tab/bottom_navigation_bar_tab.dart';
import 'lists/horizontal_container.dart';
import 'lists/singlechild_scrollview_route.dart';
import 'lists/sliver_list_route.dart';
import 'login_route.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MainListItem> items = getMainMenuItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text(homeScreenTitle),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
              onTap: () {
                navigateTo(context, item.getWidgetToNavigate(context));
              },
              child: item.getItemWidget(context));
        },
      ),
    );
  }

  void myFunctionToPass() {
    print('Function passed to the constructor is executed!');
  }
}

List<MainListItem> getMainMenuItems() {
  List<MainListItem> options = [
    ListHeaderItem("GetX Test", const GetXTest()),
    ListHeaderItem("Navigation Test", const EmptyPage()),
    ListHeaderItem("Login Page Test", const LoginRoute()),
    ListHeaderItem("Bottom navigation tab", const BottomNavigationBarTab()),
    ListHeaderItem("List Examples", const EmptyPage()),
    ListMessageItem(
        "SingleChildScrollView", const SingleChildScrollViewRoute()),
    ListMessageItem("ListView", const ListViewExampleRoute()),
    ListMessageItem("HorizontalListView", const HorizontalContainer()),
    ListMessageItem("SliverList", const SliverListRoute()),
    ListHeaderItem("Flutter layout demo", FlutterLayoutDemo()),
    ListHeaderItem("Logout", const LoginRoute()),
  ];

  return options;
}
