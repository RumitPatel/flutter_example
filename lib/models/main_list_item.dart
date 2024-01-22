import 'package:flutter/cupertino.dart';

abstract class MainListItem {
  Widget getItemWidget(BuildContext context);

  Widget getWidgetToNavigate(BuildContext context);
}
