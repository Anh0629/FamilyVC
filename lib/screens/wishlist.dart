import 'package:flutter/material.dart';
import 'Widget/wishlist_empty.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isEmpty
        ? Scaffold(body: wishListEmpty())
        : Scaffold(
            body: Container(),
          );
  }
}
