import 'package:android_flutter_examle/routes/second_route.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class LoginPageTest extends StatelessWidget {
  const LoginPageTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(loginTestTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(inputRadios),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: textSizeNormal),
                  hintText: 'Enter password here',
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(inputContentPadding),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(inputRadios),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: textSizeNormal),
                  hintText: 'Search your password here',
                  suffixIcon: Icon(Icons.remove_red_eye),
                  prefixIcon: Icon(Icons.password),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(inputContentPadding),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
              icon: Icon(Icons.login),
              label: Text('Login'),
            )
          ],
        ),
      ),
    );

    /*return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.circular(inputRadios),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: textSizeNormal),
                hintText: 'Enter password here',
                prefixIcon: Icon(Icons.email),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(inputContentPadding),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.circular(inputRadios),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: textSizeNormal),
                hintText: 'Search your password here',
                suffixIcon: Icon(Icons.remove_red_eye),
                prefixIcon: Icon(Icons.password),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(inputContentPadding),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            },
            icon: Icon(Icons.login),
            label: Text('Login'),
          )
        ],
      ),
    );*/
  }
}
