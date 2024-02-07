import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/list_header_item.dart';
import '../../models/list_message_item.dart';
import '../../models/main_list_item.dart';
import '../api_call_using_dio_library/api_call_using_dio_library.dart';
import '../api_call_using_dio_library/dio_post_example.dart';
import '../api_call_using_http_library/api_call_using_http_library.dart';
import '../bottom_navigation_bar_tab/bottom_navigation_bar_tab.dart';
import '../empty_page.dart';
import '../flutter_layout_demo/flutter_layout_demo.dart';
import '../getx_test/getx_test.dart';
import '../image_picker/image_picker.dart';
import '../lists/horizontal_container.dart';
import '../lists/listview_example_route.dart';
import '../lists/singlechild_scrollview_route.dart';
import '../lists/sliver_list_route.dart';
import '../login_route.dart';

class HomeController extends GetxController {
  final List<MainListItem> options = [
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
    ListHeaderItem("Flutter layout demo", const FlutterLayoutDemo()),
    ListHeaderItem("API call using Http library", const ApiCallUsingHttp()),
    ListHeaderItem("API call using Dio library", const ApiCallUsingDio()),
    ListMessageItem("Dio Post API example", const DioPostExample()),
    ListHeaderItem("Image Picker", const ImagePickerDemo()),
    ListHeaderItem("Logout", const LoginRoute()),
  ].obs;

  final List<MainListItem> searchedOptions = <MainListItem>[].obs;

  final queryController = TextEditingController().obs;

  List<MainListItem> getCurrentOptions() {
    if (searchedOptions.isNotEmpty) {
      return searchedOptions;
    } else {
      return options;
    }
  }

  clearQueryController() {
    queryController.value.clear();
  }

  onSearchTextChanged(String text) async {
    searchedOptions.clear();
    if (text.isEmpty) {
      return;
    }

    for (var option in options) {
      if (option.getTitle()!.toLowerCase().contains(text.toLowerCase())) {
        searchedOptions.add(option);
      }
    }
  }
}
