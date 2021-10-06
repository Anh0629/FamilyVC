import 'package:flutter/material.dart';

import 'Widget/cart_empty.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    List cartList = [];
    return cartList.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Giỏ Hàng Của Bạn'),
              //     backgroundColor: Colors.pink[200],
            ),
            body: Container(),
          );
    //   appBar: AppBar(
    //
    //   ),
    //   body: CartEmpty(),
    // );
  }
}
