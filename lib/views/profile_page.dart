import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';


class ProfilePage extends StatefulWidget {
  ProfilePage(Profile profile);

  @override
  _ProfilePageState createState() => _ProfilePageState();

  fromMap(decode) {}
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Profile Page"),
          ),
          body: Container(
            padding: EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    'https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
                    width: 200,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Name:",
                  style: TextStyle(fontSize: 23),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Address:",
                  style: TextStyle(fontSize: 23),
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  "D.O.B:",
                  style: TextStyle(fontSize: 23),
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  "E-mail:",
                  style: TextStyle(fontSize: 23),
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  "Phone No:",
                  style: TextStyle(fontSize: 23),
                ),SizedBox(height: 40,),
                Center(child: ElevatedButton(onPressed: (){}, child: Text("Save")))
              ],
            ),
          ),
        ));
  }
}
