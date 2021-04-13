import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/controllers/cart_controller.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';
import 'package:flutter_free_commerce/views/auth_view.dart';
import 'package:flutter_free_commerce/views/cart_view.dart';
import 'package:flutter_free_commerce/views/home_view.dart';
import 'package:flutter_free_commerce/views/price_details.dart';
import 'package:flutter_free_commerce/views/profile_view.dart';
import 'package:flutter_free_commerce/views/shop_view.dart';
import 'package:flutter_free_commerce/views/widgets/cart_icon.dart';
import 'package:flutter_free_commerce/views/widgets/profile_update.dart';


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
      initialized ? AuthView(): Center(child: CircularProgressIndicator()),
    );
  }

  void initApp() async {
    await Firebase.initializeApp();
    setState(() {
      initialized = true;
    });
  }
}
