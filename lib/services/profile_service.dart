import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_free_commerce/models/profile_models.dart';

class ProfileService {
  final fireStore = FirebaseFirestore.instance;
  Stream<List<Profile>> getProductStream() {
    return fireStore
        .collection('Profiles')
        .snapshots()
        .map((snapShot) => snapShot.docs.map((doc) {}).toList());
  }

  Future<List<Profile>> getProducts() async {
    /// one time read
    return fireStore.collection('Profiles').get().then((snapShot) =>
        snapShot.docs.map((doc) => Profile.fromMap(doc.data())).toList());
  }
}