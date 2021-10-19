// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel with ChangeNotifier {
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.countInStock,
    required this.dateCreated,
  });

  String id;
  String name;
  String description;
  String image;
  String price;
  Category category;
  int countInStock;
  DateTime dateCreated;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        category: Category.fromJson(json["category"]),
        countInStock: json["countInStock"],
        dateCreated: DateTime.parse(json["dateCreated"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "category": category.toJson(),
        "countInStock": countInStock,
        "dateCreated": dateCreated.toIso8601String(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
