// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

OrderModel orderFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.orderIterms,
    this.shippingAddress1,
    this.shippingAddress2,
    this.city,
    this.zip,
    this.country,
    this.phone1,
    this.phone2,
    this.status,
    this.totalPrice,
    this.profile,
    this.user,
    this.id,
    this.dateOrdered,
    this.orderId,
  });

  List<String>? orderIterms;
  String? shippingAddress1;
  String? shippingAddress2;
  String? city;
  String? zip;
  String? country;
  String? phone1;
  String? phone2;
  String? status;
  int? totalPrice;
  String? profile;
  String? user;
  String? id;
  DateTime? dateOrdered;
  String? orderId;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderIterms: List<String>.from(json["orderIterms"].map((x) => x)),
        shippingAddress1: json["shippingAddress1"],
        shippingAddress2: json["shippingAddress2"],
        city: json["city"],
        zip: json["zip"],
        country: json["country"],
        phone1: json["phone1"],
        phone2: json["phone2"],
        status: json["status"],
        totalPrice: json["totalPrice"],
        profile: json["profile"],
        user: json["user"],
        id: json["_id"],
        dateOrdered: DateTime.parse(json["dateOrdered"]),
        orderId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "orderIterms": List<dynamic>.from(orderIterms!.map((x) => x)),
        "shippingAddress1": shippingAddress1,
        "shippingAddress2": shippingAddress2,
        "city": city,
        "zip": zip,
        "country": country,
        "phone1": phone1,
        "phone2": phone2,
        "status": status,
        "totalPrice": totalPrice,
        "profile": profile,
        "user": user,
        "_id": id,
        "dateOrdered": dateOrdered!.toIso8601String(),
        "id": orderId,
      };
}
