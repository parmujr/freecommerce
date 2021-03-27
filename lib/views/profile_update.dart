import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {

  Profile profile = Profile();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Profile Update"),
            ),
            body: Form(

              child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(

                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.zero)),
                            labelText: "Name"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.zero)),
                            labelText: "Address"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.zero)),
                            labelText: "D.O.B."),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.zero)),
                            labelText: "E-mail"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero)),
                          labelText: "Phone No.",
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      // TextFormField()
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: (){},  child: Text("Submit")))
                    ],
                  ),
                ),
              ),
            )));
  }
}
