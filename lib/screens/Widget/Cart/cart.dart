import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/cart_model.dart';
import 'package:flutter_app/consts/_list/utils/global_method.dart';
import 'package:flutter_app/consts/_list/view_model/cart_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/login_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/order_view_model.dart';
//'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/profile_view_model.dart';

import 'package:flutter_app/screens/Widget/order/order.dart';
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
  var response;
  List list1 = [];
  Map<String, dynamic>? data = {};
  var map1;
  void mapToList() {
    map1.forEach((key, value) {
      list1.add({"product": key, "quatity": value});
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    List<OrderItems> list = [];

    cartProvider.cartItems.entries.forEach((e) =>
        list.add(OrderItems(e.key, e.value.quantity!.toInt().toString())));

    map1 = Map.fromIterable(list, key: (e) => e.id, value: (e) => e.sl);

    GlobalMethods globalMethod = GlobalMethods();

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
    // List<CartModel> cartList = [];

    final order = Provider.of<OrderViewModel>(context);
    final user = Provider.of<UserViewModel>(context);
    final profile = Provider.of<ProfileViewModel>(context);
    // final cartProvider = Provider.of<CartProvider>(context);

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
      Container(
        child: ElevatedButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(style: BorderStyle.none),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.red,
            ),
          ),
          child: Text(
            'Thanh toán',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
          onPressed: () => {
            // mapToList(),
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text('Hoá đơn cần thanh toán: '),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Text(
                                'Tổng hoá đơn: ${subTotal.toStringAsFixed(2)} \$ ')
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        child: Text("Thanh Toán1"),
                        onPressed: () async {
                          mapToList();
                          data = {
                            "orderIterms": list1,
                            "shippingAddress1": profile
                                    .profileList.data!.first.address!.street
                                    .toString() +
                                profile.profileList.data!.first.address!.city
                                    .toString() +
                                profile
                                    .profileList.data!.first.address!.province
                                    .toString() +
                                profile.profileList.data!.first.address!.state
                                    .toString(),
                            "shippingAddress2": "dia chi 2",
                            "city": profile
                                .profileList.data!.first.address!.city
                                .toString(),
                            "zip": "00000000",
                            "country": profile
                                .profileList.data!.first.address!.state
                                .toString(),
                            "phone1": profile.profileList.data!.first.phone,
                            "phone2": "phone 2",
                            "profile":
                                profile.profileList.data!.first.id.toString(),
                            "user": user.userModel.data!.id!.toString(),
                          };
                          print(data);

                          await order.orderIterm(data);
                        },
                      )
                    ],
                  );
                })
          },
        ),
      ),
    ]);
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

class OrderItems {
  final String sl;
  final String id;

  OrderItems(this.id, this.sl);
}
