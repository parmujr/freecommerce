import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/controllers/auth_controller.dart';
import 'package:flutter_free_commerce/controllers/profile_controller.dart';
import 'package:flutter_free_commerce/models/models.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';
import 'package:flutter_free_commerce/services/product_service.dart';
import 'package:flutter_free_commerce/views/product_view.dart';
import 'package:flutter_free_commerce/views/profile_view.dart';
import 'package:flutter_free_commerce/views/widgets/cart_icon.dart';
import 'package:flutter_free_commerce/views/widgets/product_add_edit_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_free_commerce/views/widgets/profile_update.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProfileController productController = ProfileController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Free Commerce"),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                signOut();
              },
            ),
            CartIcon()
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
                    size: 60.0,
                  ),
                ),
              ),
              ListTile(
                title: Text("Profile"),
                onTap: () async {
                  Profile _profile;

                  /// fetch profile from firebase if exist
                  final user = FirebaseAuth.instance.currentUser;
                  DocumentSnapshot doc = await FirebaseFirestore.instance
                      .collection("Profiles")
                      .doc(user.uid)
                      .get();
                  if (doc.exists) {
                    _profile = Profile.fromMap(doc.data());
                  }

                  if (_profile != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileView(_profile)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileUpdate()));
                  }
                },
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProductAddEditView(Product())));
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: StreamBuilder<List<Product>>(
            stream: ProductService().getProductStream(),
            builder: (context, snapShot) {
              if (snapShot.hasData &&
                  snapShot.connectionState != ConnectionState.done) {
                final List<Product> products = snapShot.data;
                return ListView.builder(
                  // itemCount: productController.products.length,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = products[index];
                    return ListTile(
                      leading: Image.network(product.imageUrl),
                      title: Text(product.name),
                      subtitle: Text("${product.price}"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductView(product)),
                        );
                      },
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
