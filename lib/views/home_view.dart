import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/controllers/auth_controller.dart';
import 'package:flutter_free_commerce/models/models.dart';
import 'package:flutter_free_commerce/services/product_service.dart';
import 'package:flutter_free_commerce/views/product_view.dart';
import 'package:flutter_free_commerce/views/widgets/cart_icon.dart';
import 'package:flutter_free_commerce/views/widgets/product_add_edit_form.dart';


class HomeView extends StatelessWidget {
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
