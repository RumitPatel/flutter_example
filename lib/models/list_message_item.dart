import 'package:flutter/material.dart';

import 'main_list_item.dart';

class ListMessageItem implements MainListItem {
  final String title;
  final Widget navigateToWidget;

  ListMessageItem(this.title, this.navigateToWidget);

  @override
  Widget getWidgetToNavigate(BuildContext context) {
    return navigateToWidget;
  }

  @override
  Widget getItemWidget(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 28.0),
        Expanded(
          child: Card(
            child: Row(
              children: [
                SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: Icon(Icons.arrow_forward),
                ),
                Text(title, style: Theme.of(context).textTheme.labelLarge)
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  String? getTitle() {
    return title;
  }
}
