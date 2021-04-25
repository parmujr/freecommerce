// // To parse this JSON data, do
// //
// //     final address = addressFromMap(jsonString);
// //     final profile = profileFromMap(jsonString);
// //     final order = orderFromMap(jsonString);
// //     final product = productFromMap(jsonString);
//
//
// import 'dart:convert';
//
// import 'models.dart';
//
// Address addressFromMap(String str) => Address.fromMap(json.decode(str));
//
// String addressToMap(Address data) => json.encode(data.toMap());
//
// Profile profileFromMap(String str) => Profile.fromMap(json.decode(str));
//
// String profileToMap(Profile data) => json.encode(data.toMap());
//
// Order orderFromMap(String str) => Order.fromMap(json.decode(str));
//
// String orderToMap(Order data) => json.encode(data.toMap());
//
// Product productFromMap(String str) => Product.fromMap(json.decode(str));
//
// String productToMap(Product data) => json.encode(data.toMap());
//
// class Order {
//   Order({
//     this.buyer,
//     this.products,
//     this.deliveryAddress,
//   });
//
//   final Profile buyer;
//   final List<Product> products;
//   final Address deliveryAddress;
//
//   Order copyWith({
//     Profile buyer,
//     List<Product> products,
//     Address deliveryAddress,
//   }) =>
//       Order(
//         buyer: buyer ?? this.buyer,
//         products: products ?? this.products,
//         deliveryAddress: deliveryAddress ?? this.deliveryAddress,
//       );
//
//   factory Order.fromMap(Map<String, dynamic> json) => Order(
//     buyer: json["buyer"] == null ? null : Profile.fromMap(json["buyer"]),
//     products: json["products"] == null
//         ? null
//         : List<Product>.from(
//         json["products"].map((x) => Product.fromMap(x))),
//     deliveryAddress: json["deliveryAddress"] == null
//         ? null
//         : Address.fromMap(json["deliveryAddress"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "buyer": buyer == null ? null : buyer.toMap(),
//     "products": products == null
//         ? null
//         : List<dynamic>.from(products.map((x) => x.toMap())),
//     "deliveryAddress":
//     deliveryAddress == null ? null : deliveryAddress.toMap(),
//   };
// }
//
// class Profile {
//   Profile({
//     this.uid,
//     this.name,
//     this.email,
//     this.mobileNumber,
//   });
//
//   String uid;
//   String name;
//   String email;
//   String mobileNumber;
//
//   Profile copyWith({
//     String uid,
//     String name,
//     String email,
//     String mobileNumber,
//   }) =>
//       Profile(
//         uid: uid ?? this.uid,
//         name: name ?? this.name,
//         email: email ?? this.email,
//         mobileNumber: mobileNumber ?? this.mobileNumber,
//       );
//
//   factory Profile.fromMap(Map<String, dynamic> json) => Profile(
//     uid: json["uid"] == null ? null : json["uid"],
//     name: json["name"] == null ? null : json["name"],
//     email: json["email"] == null ? null : json["email"],
//     mobileNumber:
//     json["mobileNumber"] == null ? null : json["mobileNumber"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "uid": uid == null ? null : uid,
//     "name": name == null ? null : name,
//     "email": email == null ? null : email,
//     "mobileNumber": mobileNumber == null ? null : mobileNumber,
//   };
// }
//
// class Address {
//   Address({
//     this.addressLine1,
//     this.landMark,
//     this.area,
//     this.city,
//     this.state,
//     this.country,
//   });
//
//   final String addressLine1;
//   final String landMark;
//   final String area;
//   final String city;
//   final String state;
//   final String country;
//
//   Address copyWith({
//     String addressLine1,
//     String landMark,
//     String area,
//     String city,
//     String state,
//     String country,
//   }) =>
//       Address(
//         addressLine1: addressLine1 ?? this.addressLine1,
//         landMark: landMark ?? this.landMark,
//         area: area ?? this.area,
//         city: city ?? this.city,
//         state: state ?? this.state,
//         country: country ?? this.country,
//       );
//
//   factory Address.fromMap(Map<String, dynamic> json) => Address(
//     addressLine1:
//     json["addressLine1"] == null ? null : json["addressLine1"],
//     landMark: json["landMark"] == null ? null : json["landMark"],
//     area: json["area"] == null ? null : json["area"],
//     city: json["city"] == null ? null : json["city"],
//     state: json["state"] == null ? null : json["state"],
//     country: json["country"] == null ? null : json["country"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "addressLine1": addressLine1 == null ? null : addressLine1,
//     "landMark": landMark == null ? null : landMark,
//     "area": area == null ? null : area,
//     "city": city == null ? null : city,
//     "state": state == null ? null : state,
//     "country": country == null ? null : country,
//   };
// }

// To parse this JSON data, do
//
//     final product = productFromMap(jsonSt
import 'dart:convert';

Order orderFromMap(String str) => Order.fromMap(json.decode(str));

String orderToMap(Order data) => json.encode(data.toMap());

class Order {
  Order({
    this.id,
    this.name,
    this.address,
    this.email,
    this.phone,
  });

  String id;
  String name;
  String address;
  String email;
  String phone;

  Order copyWith({
    String id,
    String name,
    String address,
    String email,
    String phone,
  }) =>
      Order(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );


  ///fromMap
  factory Order.fromMap(Map<String, dynamic> json) => Order(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    address: json["address"] == null ? null : json["address"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
  );


  ///toMap
  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "address": address == null ? null : address,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
  };
}
