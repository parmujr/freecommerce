// To parse this JSON data, do
//
//     final product = productFromMap(jsonSt
import 'dart:convert';

Profile profileFromMap(String str) => Profile.fromMap(json.decode(str));

String profileToMap(Profile data) => json.encode(data.toMap());

class Profile {
  Profile({
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

  Profile copyWith({
    String id,
    String name,
    String address,
    String email,
    String phone,
  }) =>
      Profile(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );

  ///fromMap
  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
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
