import 'package:flutter/material.dart';


class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        actions: [
          IconButton(icon: Icon(Icons.save),
            onPressed: (){},),
          IconButton(icon: Icon(Icons.add_shopping_cart),
          onPressed: (){},)
        ],
      ),body: Container(

    ),
    );
  }
}
