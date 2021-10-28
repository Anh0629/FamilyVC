import 'package:flutter/material.dart';

class WishModel with ChangeNotifier {
  final String? id;
  final String? productId;
  final String? title;
  final double? price;
  final String? imageUrl;
  final double? quantity;

  WishModel({
    this.id,
    @required this.productId,
    this.title,
    this.price,
    this.imageUrl,
    this.quantity,
  });
}
