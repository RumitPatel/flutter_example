import 'package:android_flutter_examle/utilities/app_utils.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'home_route.dart';

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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
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
                    hintStyle: const TextStyle(fontSize: textSizeNormal),
                    hintText: lblEmailPlaceholder,
                    prefixIcon: const Icon(Icons.email),
                    contentPadding: const EdgeInsets.only(
                        left: 15, bottom: 10, top: 10, right: 15),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
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
                      hintStyle: const TextStyle(fontSize: textSizeNormal),
                      hintText: lblPasswordPlaceholder,
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15)),
                  onFieldSubmitted: (value) {
                    checkAndGo();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    checkAndGo();
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

  void checkAndGo() {
    if (_formKey.currentState!.validate()) {
      snack(context, tempTextProcessingData);
      navigateTo(context, const HomeRoute());
    }
  }
}
