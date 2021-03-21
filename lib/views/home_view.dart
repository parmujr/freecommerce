import 'package:flutter/material.dart';
import 'package:flutter_free_commerce/controllers/product_controller.dart';
import 'package:flutter_free_commerce/models/models.dart';
import 'package:flutter_free_commerce/services/product_service.dart';
import 'package:flutter_free_commerce/views/product_view.dart';
import 'package:flutter_free_commerce/views/wigets/cart_icon.dart';
import 'package:flutter_free_commerce/views/wigets/product_add_edit_form.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductController productController = ProductController();

  @override
  void initState() {
    loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Free Commerce"),
          actions: [CartIcon()],
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

  void loadData() async {
    await productController.getProducts();
    setState(() {});
  }
}