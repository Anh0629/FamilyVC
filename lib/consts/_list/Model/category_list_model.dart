// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel with ChangeNotifier {
  CategoryModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
