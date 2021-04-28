import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/views/first_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

// ignore: non_constant_identifier_names
final Auth = FirebaseAuth.instance;
String email;
String password;
String reEnterPassword;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration'),),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange[900],
          Colors.orange[800],
          Colors.orange[400],
        ])),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Buy Easy",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "welcome",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Enter your Email or Phone",
                                  hintText: "Email or Phone",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onChanged: (value) {
                                  email = value;
                                }),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Enter your password",
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                password = value;
                              },
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "ReEnter your password",
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                reEnterPassword = value;
                              },
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            child: RaisedButton(
                              color: Colors.blue,
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () async {
                                try {
                                  final newUser =
                                      await Auth.createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  if (newUser != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                FirstPage()));
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
