import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_utils.dart';
import '../api_call_using_http_library/http_api_utils.dart';
import '../api_call_using_http_library/ui/error_msg_part.dart';
import '../api_call_using_http_library/ui/progress_part.dart';

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class DioPostExample extends StatefulWidget {
  const DioPostExample({super.key});

  @override
  _DioPostExampleState createState() => _DioPostExampleState();
}

class _DioPostExampleState extends State<DioPostExample> {
  bool isLoading = false;
  String errorMsg = '';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void addUser() async {
    String name = nameController.text;
    String email = emailController.text;

    if (name.isEmpty || email.isEmpty) {
      showSnackBottom('Error', 'Name and Email should not be empty.');
      return;
    }

    updateLoadingStatus(true, '');

    printI('Going to add new user:$name\nemail:$email');
    try {
      Response response = await Dio().post(
        '${baseURLJPHolder}users',
        data: {'name': name, 'email': email},
      );
      printI('API response: ${response.toString()}');
      User newUser = User.fromJson(response.data);
      printI('New user added with ID: ${newUser.id}');
      // Clear the text fields after successful submission
      nameController.clear();
      emailController.clear();

      updateLoadingStatus(false, '');
      showSnackBottom('User ${newUser.id}', 'New user Successfully created');
    } catch (e) {
      printI('Error adding user: $e');
      updateLoadingStatus(false, 'Error adding user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dio POST Example')),
      body: isLoading
          ? const ProgressPart()
          : errorMsg.isNotEmpty
              ? ErrorMsgPart(errorMsg: errorMsg)
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: nameController..text = 'Rumit',
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      TextField(
                        controller: emailController..text = 'rum@df.dfi',
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: addUser,
                        child: const Text('Add User'),
                      ),
                    ],
                  ),
                ),
    );
  }

  void updateLoadingStatus(loadingStatus, errorMessage) {
    setState(() {
      isLoading = loadingStatus;
      errorMsg = errorMessage;
    });
  }
}
