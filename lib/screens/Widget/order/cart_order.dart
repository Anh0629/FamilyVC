import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/view_model/cart_view_model.dart';
import 'package:flutter_app/screens/Widget/Cart/cart_empty.dart';
import 'package:flutter_app/screens/Widget/Cart/cart_full.dart';
import 'package:provider/provider.dart';

class CartOrderScreen extends StatefulWidget {
  static const routeName = '/CartOrderScreen';

  @override
  _CartOderScreenState createState() => _CartOderScreenState();
}

class _CartOderScreenState extends State<CartOrderScreen> {
  var response;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            body: CartEmpty(),
          )
        : Scaffold(
            bottomSheet: checkoutSection(context, cartProvider.totalAmount),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                'Giỏ Hàng (${cartProvider.getCartItems.length})',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              color: Theme.of(context).backgroundColor,
              child: Container(
                child: ListView.builder(
                  itemCount: cartProvider.getCartItems.length,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return ChangeNotifierProvider.value(
                      value: cartProvider.getCartItems.values.toList()[idx],
                      child: CartFullScreen(
                        productId: cartProvider.getCartItems.keys.toList()[idx],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
  }

  Widget checkoutSection(BuildContext ctx, double subTotal) {
    return Row(children: [
      Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Total Amount: ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // ignore: deprecated_member_use
                            color: Theme.of(ctx).textSelectionColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        '${subTotal.toStringAsFixed(2)} \$',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
