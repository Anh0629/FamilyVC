// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<InfModel> infModelFromJson(String str) =>
    List<InfModel>.from(json.decode(str).map((x) => InfModel.fromJson(x)));

String infModelToJson(List<InfModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfModel {
  InfModel({
    required this.id,
    required this.phone,
    required this.city,
    required this.country,
    required this.home,
  });

  String id;
  String phone;
  String city;
  String country;
  String home;

  factory InfModel.fromJson(Map<String, dynamic> json) => InfModel(
        id: json["_id"],
        phone: json["phone"],
        city: json["city"],
        country: json["country"],
        home: json["home"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone": phone,
        "city": city,
        "country": country,
        "home": home,
      };
}
