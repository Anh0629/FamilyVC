// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

// ignore: non_constant_identifier_names
UserUpdatePassword UserUpdatePasswordFromJson(String str) => UserUpdatePassword.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String UserUpdatePasswordToJson(UserUpdatePassword data) => json.encode(data.toJson());

class UserUpdatePassword with ChangeNotifier {
    UserUpdatePassword({
         this.id,
         this.username,
         this.email,
         this.passwordHash,
         this.isAdmin,
         this.currentPassword,
         this.password,
    });

    String? id;
    String? username;
    String? email;
    String? passwordHash;
    bool? isAdmin;
    String? currentPassword;
    String? password;


    factory UserUpdatePassword.fromJson(Map<String, dynamic> json) => UserUpdatePassword(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        passwordHash: json["passwordHash"],
        isAdmin: json["isAdmin"],
        currentPassword: json["currentPassword"],
        password: json["password"]

    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "passwordHash": passwordHash,
        "isAdmin": isAdmin,
        "currentPassword":currentPassword,
        "password":password,
    };
}