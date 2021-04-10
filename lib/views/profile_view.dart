import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';

import 'widgets/profile_update.dart';

class ProfileView extends StatefulWidget {

  ProfileView(Profile profile);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}
class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Profile Page"),
          ),drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.grey,
                child: SizedBox(
                  height: 150.0,
                  child: Icon(
                    Icons.person,
                    size: 80.0,
                  ),
                ),
              ),
              ListTile(
                  title: Text("Update Profile"),
                  onTap: () async {
                    Profile profile;


                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileUpdate()));
                  }
              ),
            ],
          ),
        ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    'https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
                    width: 100,
                  ),
                ),
                Column(
                  children: [
                    Text("Name"),
                    Text("Address"),
                    Text("Email"),
                    Text("Phone"),

                  ],
                )
              ],
            ),
          ),
        ));
  }
}
