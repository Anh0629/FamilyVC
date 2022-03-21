// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel with ChangeNotifier {
  UserModel({
    this.status,
    this.message,
    this.data,

  });

  bool? status;
  String? message;
  Data? data;


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
       
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({this.id, this.isAdmin, this.username, this.email});

  String? id;
  bool? isAdmin;
  String? username;
  String? email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        isAdmin: json["isAdmin"],
        username: json["username"],
        email: json["email"]
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "isAdmin": isAdmin,
        "username": username,
        "email": email,
      };
}
