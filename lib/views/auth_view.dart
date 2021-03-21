import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Free Commerce"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("SignIn With Google"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
