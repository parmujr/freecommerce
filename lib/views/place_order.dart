
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/delivery_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_free_commerce/views/order_view.dart';

// ignore: must_be_immutable
class PlaceOrder extends StatefulWidget {
  Order order = Order();
  PlaceOrder({this.order});
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}
class _PlaceOrderState extends State<PlaceOrder> {
  Order order = Order();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Orders Details"),
            actions: [
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  var form = _formKey.currentState;
                  if (form.validate()) {
                    /// data is valid. lets save the form.
                    form.save();



                    /// form data is now valid. you may save to db.
                    if (order.id != null) {
                      FirebaseFirestore.instance
                          .collection("Orders")
                          .doc(order.id)
                          .set(order.toMap(), SetOptions(merge: true));
                    } else {
                      FirebaseFirestore.instance
                          .collection("Orders")
                          .doc()
                          .set(order.toMap(), SetOptions(merge: true));
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderView(order)));
                    final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Your Order Has Been Placed'));

                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar);
                  }
                },
              )
            ],
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              children: [
                TextFormField(
                  initialValue: order.name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      labelText: "Name"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your name" : null,
                  onSaved: (value) => order.name = value,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: order.address,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      labelText: "Delivery Address"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your address" : null,
                  onSaved: (value) => order.address = value,
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: order.email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      labelText: "Email"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your email id" : null,
                  onSaved: (value) => order.email = value,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: order.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      labelText: "Phone"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your phone no" : null,
                  onSaved: (value) => order.phone = value,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}