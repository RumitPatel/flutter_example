import 'package:flutter/material.dart';

import 'main_list_item.dart';

class ListHeaderItem implements MainListItem {
  final String heading;
  final Widget navigateToWidget;

  ListHeaderItem(this.heading, this.navigateToWidget);

  @override
  Widget getWidgetToNavigate(BuildContext context) {
    return navigateToWidget;
  }

  @override
  Widget getItemWidget(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 60.0,
          width: 60.0,
          child: Icon(Icons.arrow_forward),
        ),
        Text(heading, style: Theme.of(context).textTheme.headlineSmall)
      ],
    );
  }
}
