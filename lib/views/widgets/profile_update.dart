import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_free_commerce/views/profile_view.dart';

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
                    onPressed: () async {
                      var form = _formKey.currentState;

                      ///
                      /// 1. Validate the form data by calling form.validate()
                      if (form.validate()) {
                        /// 2. Save the form fields value by calling form.save()
                        form.save();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfileView(profile)));
                        /// 3. Save data to the server/ database by calling service.save()
                        /// get firebase auth uid
                        var user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          try {
                            await FirebaseFirestore.instance
                                .collection("Profiles")
                                .doc(user.uid)
                                .set(profile.toMap());
                          } catch (e) {
                            final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Sorry! something went wrong'));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {}


                      }
                    })
              ],
            ),
            body: Container(
              child: Form(
                key: _formKey,
                  child: ListView(
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
              ),
            )));
  }
}
