import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopView extends StatefulWidget {
  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shopping"),
        ),
        body: Card(

          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "The name of the product",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Flexible(
                      child: Image.network(
                        'https://www.incimages.com/uploaded_files/image/1920x1080/getty_939837832_386488.jpg',
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '₹ 699',
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Delivery By',
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () => print(Text('hg')),
                        child: Text("Save For Later")),
                    ElevatedButton(
                        onPressed: () => print(Text('jf')),
                        child: Text("Remove")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
