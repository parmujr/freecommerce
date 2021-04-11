import 'package:flutter/material.dart';

class PriceDetails extends StatefulWidget {
  @override
  _PriceDetailsState createState() => _PriceDetailsState();
}

class _PriceDetailsState extends State<PriceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Price Details"),
      ),
      body: Container(
          color: Colors.green,
          child: Column(
            children: [
              Text(
                "Price",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Discount",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Delivery Charges",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Total Amount",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [

                ],
              )
            ],
          ),
      ),
    );
  }
}
