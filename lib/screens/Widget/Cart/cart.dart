import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/utils/global_method.dart';
import 'package:flutter_app/consts/_list/view_model/cart_view_model.dart';
import 'package:flutter_app/screens/Widget/WishList/wishlist_full.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'cart_empty.dart';
import 'cart_full.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   StripeService.init();
  // }

  var response;

  // GlobalMethod globalMethod = GlobalMethod();

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethod = GlobalMethods();

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
              actions: [
                IconButton(
                  icon: Icon(Feather.trash),
                  onPressed: () {
                    globalMethod.showDialogg(
                      'Xoá Hết',
                      'Bạn chắc chắn xoá tất cả!',
                      () => cartProvider.clearCartItems(),
                      context,
                    );
                  },
                )
              ],
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
    // var uuid = Uuid();

    // final FirebaseAuth _auth = FirebaseAuth.instance;
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
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
            // Container(
            //   width: 150,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   child: Material(
            //     color: Colors.transparent,
            //     child: InkWell(
            //       borderRadius: BorderRadius.circular(30),
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           'Checkout',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 18,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ),
            //       onTap: () async {
            //         double amountInCents = subTotal * 1000;
            //         int integerAmount = (amountInCents / 10).ceil();
            //         await payWithCard(amount: integerAmount);
            //         if (response.success == true) {
            //           User user = _auth.currentUser;
            //           final _uid = user.uid;
            //           cartProvider.getCartItems
            //               .forEach((key, orderValue) async {
            //             final orderId = uuid.v4();
            //             try {
            //               await FirebaseFirestore.instance
            //                   .collection('orders')
            //                   .doc(orderId)
            //                   .set({
            //                 'orderId': orderId,
            //                 'userId': _uid,
            //                 'productId': orderValue.productId,
            //                 "title": orderValue.title,
            //                 'price': orderValue.price * orderValue.quantity,
            //                 'imageUrl': orderValue.imageUrl,
            //                 'quantity': orderValue.quantity,
            //                 'orderDate': Timestamp.now(),
            //               });
            //             } catch (e) {}
            //           });
            //         } else {
            //           globalMethod.authErrorHandle(
            //             'Please enter your true infomation',
            //             context,
            //           );
            //         }
            //       },
            //     ),
            //   ),
            // ),
            // Spacer(),
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
    );
  }

  void showDiaLog(String title, String subtitle, Function fct) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'name',
                    height: 20,
                    width: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title),
                )
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('Huỷ')),
              TextButton(onPressed: () => fct, child: Text('Xoá'))
            ],
          );
        });
  }
}
