import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';

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
              ],
            ),
          ),
        ));
  }
}
