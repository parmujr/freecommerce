import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_free_commerce/models/models.dart';

class ProductService {
  final fireStore = FirebaseFirestore.instance;

  Stream<List<Product>> getProductStream() {
    return fireStore
        .collection('Products')
        .snapshots()
        .map((snapShot) => snapShot.docs.map((doc) {
      Product p = Product.fromMap(doc.data());
      p.id = doc.id;
      return p;
    }).toList());
  }

  Future<List<Product>> getProducts() async {
    /// one time read
    return fireStore.collection('Products').get().then((snapShot) =>
        snapShot.docs.map((doc) => Product.fromMap(doc.data())).toList());

    /// listen to real time snapshot


  }
}