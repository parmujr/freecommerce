import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/controllers/cart_controller.dart';
import 'package:flutter_free_commerce/views/first_page.dart';
import 'package:flutter_free_commerce/views/sign_in.dart';


final cart = CartController();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool initialized = false;

  @override
  void initState() {
    initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter e-commerce',
      home:
      initialized ? FirstPage() : Center(child: CircularProgressIndicator()),
    );
  }

  void initApp() async {
    await Firebase.initializeApp();
    setState(() {
      initialized = true;
    });
  }
}
