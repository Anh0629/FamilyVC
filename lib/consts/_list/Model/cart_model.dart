import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  final String? id;
  final String? productId;
  final String? title;
  final double? quantity;
  final double? price;
  final String? imageUrl;
  final double? value;

  CartModel(
      {this.id,
      @required this.productId,
      this.title,
      this.quantity,
      this.price,
      this.imageUrl,
      this.value});
}
