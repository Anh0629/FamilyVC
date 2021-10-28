// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.passwordHash,
    required this.isAdmin,
    required this.information,
  });

  String id;
  String username;
  String email;
  String passwordHash;
  bool isAdmin;
  Information information;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        passwordHash: json["passwordHash"],
        isAdmin: json["isAdmin"],
        information: Information.fromJson(json["Information"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "passwordHash": passwordHash,
        "isAdmin": isAdmin,
        "Information": information.toJson(),
      };
}

class Information {
  Information({
    required this.id,
    required this.phone,
    required this.home,
    required this.city,
    required this.country,
  });

  String id;
  String phone;
  String home;
  String city;
  String country;

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        id: json["_id"],
        phone: json["phone"],
        home: json["home"],
        city: json["city"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone": phone,
        "home": home,
        "city": city,
        "country": country,
      };
}
