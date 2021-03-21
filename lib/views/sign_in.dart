import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_free_commerce/controllers/auth_controller.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("SignIn Page")
          ),
            body: Container(
              padding: EdgeInsets.all(100.0),
              child: Column(

                children: [
                  ElevatedButton(
                    child: Text("Sign In With Google"),
                    onPressed: () {
                      signInWithGoogle();
                    },
                  )
                ],
              ),
            )));
  }
}
