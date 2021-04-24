
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/delivery_models.dart';
import 'package:flutter_free_commerce/views/order_view.dart';


class PlaceOrder extends StatefulWidget {


  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}


class _PlaceOrderState extends State<PlaceOrder> {
  Order order = Order();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delivery Details"),),

      body: Form(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Full Name"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Email Address"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Mobile No"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Landmark Area"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Zip Code"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "City, State, Country"),
            ),
            SizedBox(
              height: 10,
            ), Container(
              padding: EdgeInsets.all(50.0),
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text("Place Order"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => OrderView(this.order)));

                    },
                  )
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}
