import 'package:android_flutter_examle/screens/home_route.dart';
import 'package:android_flutter_examle/utilities/app_utils.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({super.key});

  @override
  LoginRouteState createState() {
    return LoginRouteState();
  }
}

class LoginRouteState extends State<LoginRoute> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(formTitle),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return msgIncorrectEmailError;
                    }
                    if (isValidEmail(value)) {
                      return msgIncorrectEmailError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    filled: true,
                    fillColor: Colors.cyan,
                    hintStyle: TextStyle(fontSize: textSizeNormal),
                    hintText: lblEmailPlaceholder,
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 10, top: 10, right: 15),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return msgIncorrectPasswordError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      fillColor: Colors.cyan,
                      hintStyle: TextStyle(fontSize: textSizeNormal),
                      hintText: lblPasswordPlaceholder,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSnackBar(context, tempTextProcessingData);
                      navigateTo(context, HomeRoute());
                    }
                  },
                  child: const Text(lblSubmit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
