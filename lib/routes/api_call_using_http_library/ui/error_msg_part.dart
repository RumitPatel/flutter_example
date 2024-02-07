import 'package:flutter/cupertino.dart';

class ErrorMsgPart extends StatelessWidget {
  const ErrorMsgPart({
    super.key,
    required this.errorMsg,
  });

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMsg));
  }
}
