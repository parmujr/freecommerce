// To parse this JSON data, do
//
//     final product = productFromMap(jsonSt
import 'dart:convert';

Profile profileFromMap(String str) => Profile.fromMap(json.decode(str));

String profileToMap(Profile data) => json.encode(data.toMap());

class Profile{
  Profile({
    this.name,
    this.address,
    this.dob,
    this.email,
    this.phone,
  });


  String name;
  String address;
  String dob;
  String email;
  String phone;

  Profile copyWith({
   String name,
   String address,
   String dob,
   String email,
   String phone,
  }) =>
      Profile(

        name:name ?? this.name,
        address: address ?? this.address,
        dob: dob ?? this.dob,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(

    name: json["name"] == null ? null : json["name"],
    address: json["address"] == null ? null : json["address"],
    dob: json["dob"] == null ? null : json["dob"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],

  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "address": address == null ? null : address,
    "dob": dob == null ? null : dob,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,

  };
}