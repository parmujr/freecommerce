import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';
import 'package:flutter_free_commerce/views/widgets/profile_update.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  Profile _profile;

  ProfileView(this._profile);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'My Profile',
          )),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfileUpdate(profile: Profile())));
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Image.network(
                    "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"),
                decoration: BoxDecoration(color: Colors.white),
              ),
              ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Account"),
                  subtitle: Text("Personal"),
                  trailing: Icon(Icons.edit),
                  onTap: () {}),
              ListTile(
                  leading: Icon(Icons.email),
                  title: Text("Email"),
                  subtitle: Text("parmujr@gmail.com"),
                  trailing: Icon(Icons.send),
                  onTap: () {}),
              ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Text("Phone"),
                  subtitle: Text("8968909754"),
                  trailing: Icon(Icons.call),
                  onTap: () {})
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [

              Icon(
                Icons.person,
                size: 70,
              ),
              ListTile(
                title: Text(
                  _profile.name ?? '',
                ),
                subtitle: Text("Full Name"),
              ),
              ListTile(
                title: Text(
                  _profile.address ?? '',
                ),
                subtitle: Text("Address"),
              ),
              ListTile(
                title: Text(
                  _profile.email ?? '',
                ),
                subtitle: Text("Email Id"),
              ),
              ListTile(
                title: Text(
                  _profile.phone ?? '',
                ),
                subtitle: Text("Mobile Number"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
