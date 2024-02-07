import 'package:flutter/cupertino.dart';

abstract class MainListItem {
  String? getTitle();

  Widget? getItemWidget(BuildContext context);

  Widget? getWidgetToNavigate(BuildContext context);
}
