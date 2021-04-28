import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_free_commerce/controllers/auth_controller.dart';
import 'package:flutter_free_commerce/views/home_view.dart';
import 'package:flutter_free_commerce/views/sign_up.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

// ignore: non_constant_identifier_names
final Auth = FirebaseAuth.instance;
String email;
String password;

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: 35,
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
              height: 10,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
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
                          Text("Forget Password?",
                              style: TextStyle(color: Colors.grey)),
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
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                onPressed: () async {
                                  {
                                    try {
                                      final user = Auth
                                              .signInWithEmailAndPassword(
                                                  email: email,
                                                  password: password)
                                          .then((user) => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          HomeView())));
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                }),
                          ),
                          SizedBox(height: 20),
                          Text("Don't have account",
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            child: RaisedButton(
                              color: Colors.redAccent,
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignUp()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Continue with social media",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                    child: Image.network(
                                        'https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png'),
                                  ),
                                ),
                                onTap: () {
                                  signInWithGoogle();
                                },
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Image.network(
                                      'https://www.sharethis.com/wp-content/uploads/2017/11/Facebook-share-icon.png'),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Image.network(
                                      'https://cdn4.iconfinder.com/data/icons/social-media-icons-the-circle-set/48/twitter_circle-512.png'),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Image.network(
                                      'https://images.vexels.com/media/users/3/137380/isolated/preview/1b2ca367caa7eff8b45c09ec09b44c16-instagram-icon-logo-by-vexels.png'),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Image.network(
                                      'https://image.flaticon.com/icons/png/512/25/25231.png'),
                                ),
                              ),
                            ],
                          )
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
