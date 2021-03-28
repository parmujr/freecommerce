
import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                        if (profile.name != null) {
                          FirebaseFirestore.instance
                              .collection("Profiles")
                              .doc(profile.name)
                              .set(profile.toMap(), SetOptions(merge: true));
                        } else {
                          FirebaseFirestore.instance
                              .collection("Profiles")
                              .doc()
                              .set(profile.toMap(), SetOptions(merge: true));
                        }

                        Navigator.pop(context,);

                      }
                    })
              ],
            ),
            body: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero)),
                            labelText: "Name"),
                        initialValue: profile.name,
                        validator: (value) => _validate(value, "Name"),
                        onSaved: (value) {
                          profile.name = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero)),
                            labelText: "Address"),
                        initialValue: profile.address,
                        validator: (value) => _validate(value, "Address"),
                        onSaved: (value) {
                          profile.address = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero)),
                            labelText: "D.O.B."),
                        initialValue: profile.dob,
                        validator: (value) => _validate(value, "D.O.B"),
                        onSaved: (value) {
                          profile.dob = value;
                        },
                        keyboardType: TextInputType.number,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero)),
                            labelText: "E-mail"),
                        initialValue: profile.email,
                        validator: (value) => _validate(value, "E-mail"),
                        onSaved: (value) {
                          profile.email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero)),
                            labelText: "Phone No."),
                        initialValue: profile.phone,
                        validator: (value) => _validate(value, "Phone No"),
                        onSaved: (value) {
                          profile.phone = value;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                      // TextFormField()
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Submit")))
                    ],
                  ),
                ),
              ),
            )));
  }

  _validate(value, fieldName) {
    if (value.isEmpty) {
      return "$fieldName is required.";
    } else
      return null;
  }
}
