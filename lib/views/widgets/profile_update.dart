
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/models.dart';
import '../profile_view.dart';
import 'product_add_edit_form.dart';


class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  Profile profile = Profile();


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Profile Update"),
            actions: [
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  var form = _formKey.currentState;
                  if (form.validate()) {
                    /// data is valid. lets save the form.
                    form.save();



                    /// form data is now valid. you may save to db.
                    if (profile.id != null) {
                      FirebaseFirestore.instance
                          .collection("Profiles")
                          .doc(profile.id)
                          .set(profile.toMap(), SetOptions(merge: true));
                    } else {
                      FirebaseFirestore.instance
                          .collection("Profiles")
                          .doc()
                          .set(profile.toMap(), SetOptions(merge: true));
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileView(profile)));
                    final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Your Profile Has Been Updated'));

                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar);
                  }
                },
              )
            ],
          ),
          drawer: Drawer(
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
                    title: Text("View Profile"),
                    onTap: () async {
                      Profile profile;


                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView(profile)));
                    }
                ),
                ListTile(
                    title: Text("GoToProduct"),
                    onTap: () async {


                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductAddEditView(Product())));
                    }
                )
              ],
            ),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              children: [
                TextFormField(
                  initialValue: profile.name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      labelText: "Name"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your name" : null,
                  onSaved: (value) => profile.name = value,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: profile.address,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      labelText: "Address"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your address" : null,
                  onSaved: (value) => profile.address = value,
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: profile.email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      labelText: "Email"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your email id" : null,
                  onSaved: (value) => profile.email = value,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: profile.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      labelText: "Phone"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your phone no" : null,
                  onSaved: (value) => profile.phone = value,
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