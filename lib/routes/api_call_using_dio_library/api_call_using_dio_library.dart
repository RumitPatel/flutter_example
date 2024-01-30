import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_utils.dart';
import '../api_call_using_http_library/http_api_utils.dart';
import '../api_call_using_http_library/model/user.dart';
import '../api_call_using_http_library/ui/error_msg_part.dart';
import '../api_call_using_http_library/ui/progress_part.dart';

class ApiCallUsingDio extends StatefulWidget {
  const ApiCallUsingDio({super.key});

  @override
  _ApiCallUsingDioState createState() => _ApiCallUsingDioState();
}

class _ApiCallUsingDioState extends State<ApiCallUsingDio> {
  List<User> users = [];
  bool isLoading = true;
  String errorMsg = '';

  @override
  void initState() {
    super.initState();

    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      Response response = await Dio().get('${baseURLJPHolder}users');

      List<dynamic> jsonData = response.data;

      setState(() {
        users = jsonData.map((user) => User.fromJson(user)).toList();
        isLoading = false;
        errorMsg = '';
      });
    } catch (e) {
      printI('Error fetching users: $e');
      setState(() {
        errorMsg = 'Error fetching users: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dio Example')),
      body: isLoading
          ? const ProgressPart()
          : errorMsg.isNotEmpty
              ? ErrorMsgPart(errorMsg: errorMsg)
              : ListPart(users: users),
    );
  }
}

class ListPart extends StatelessWidget {
  const ListPart({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(users[index].name));
        },
      ),
    );
  }
}

