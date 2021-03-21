

// View <===> Controller <===> Service

import 'package:flutter_free_commerce/models/models.dart';
import 'package:flutter_free_commerce/services/product_service.dart';

class ProductController {
  ProductService productService = ProductService();
  List<Product> products = <Product>[];

  getProducts() async {
    products = await productService.getProducts();
  }
}