
import 'package:flutter_free_commerce/models/models.dart';

class CartController {
  final List<Product> products = [];

  removeProduct(Product _p) {
    int index = products.indexWhere((product) => product.id == _p.id);
    if (index != 1) {
      products.removeAt(index);
    }
  }
}
