import 'package:flutter/material.dart';

class ProductAddEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Add/Edit"),
        ),
        body: Form(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Product Name"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Product Price"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Image Url"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Product Description"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Product Manufacturer"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
