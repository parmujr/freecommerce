import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_free_commerce/models/delivery_models.dart';

class OrderService {
  final fireStore = FirebaseFirestore.instance;
  Stream<List<Order>> getProductStream() {
    return fireStore
        .collection('Orders')
        .snapshots()
        .map((snapShot) => snapShot.docs.map((doc) {}).toList());
  }

  Future<List<Order>> getProducts() async {
    /// one time read
    return fireStore.collection('Orders').get().then((snapShot) =>
        snapShot.docs.map((doc) => Order.fromMap(doc.data())).toList());
  }
}