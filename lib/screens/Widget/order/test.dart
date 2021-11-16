import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/consts/_list/Model/cart_model.dart';
import 'package:flutter_app/consts/_list/Model/profiles_model.dart';
import 'package:flutter_app/consts/_list/view_model/cart_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/login_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/order_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  static String routeName = "/order";
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final TextEditingController nameController = TextEditingController();

  Map<String, dynamic>? data = {};
  List<CartModel> cartList = [];

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderViewModel>(context);
    final user = Provider.of<UserViewModel>(context);
    final profile = Provider.of<ProfileViewModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    List<OrderItems> list = [];
    var map1 = Map.fromIterable(list, key: (e) => e.id, value: (e) => e.sl);
    List list1 = [];
    void mapToList() {
      map1.forEach((key, value) {
        list1.add({"product": key, "quatity": value});
      });

      print(list1.toString());
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(30)),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.white,
              // child: SingleChildScrollView(
              //   child: CartOrderScreen(),
              // ),
            ),
            text('Tổng đơn: '),
            ElevatedButton(
              onPressed: () async {
                mapToList();
                data = {
                  "orderIterms": list1,
                  "shippingAddress1": profile
                          .profileList.data!.first.address!.street
                          .toString() +
                      profile.profileList.data!.first.address!.city.toString() +
                      profile.profileList.data!.first.address!.province
                          .toString() +
                      profile.profileList.data!.first.address!.state.toString(),
                  "shippingAddress2": "dia chi 2",
                  "city":
                      profile.profileList.data!.first.address!.city.toString(),
                  "zip": "00000000",
                  "country":
                      profile.profileList.data!.first.address!.state.toString(),
                  "phone1": profile.profileList.data!.first.phone,
                  "phone2": "phone 2",
                  "profile": profile.profileList.data!.first.id.toString(),
                  "user": user.userModel.data!.id!.toString(),
                };
                print(data);
                print(jsonEncode(data));

                // print(cartProvider.cartItems);

                await order.orderIterm(data);
              },
              child: Text('Post'),
            )
          ],
        ),
      ),
    );
  }
}

// LÀM ĐƯỢC GỒI haha thấy gồi
Widget textFormField(TextEditingController controller, String title,
    BuildContext context, String hintText) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      splashColor: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            labelText: title,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.orange, width: 3)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.teal.shade300, width: 3)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 3)),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 3),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget text(String title) {
  return Container(
    child: Text(
      title,
      style: TextStyle(color: Colors.orange),
    ),
  );
}

class OrderItems {
  final String sl;
  final String id;

  OrderItems(this.sl, this.id);
}

// {
//     "orderIterms":[
//         {
//             "quatity":2,
//             "product":"616a8f6f133479a4aeae37c7"
//         },
//         {
//             "quatity":3,
//             "product":"616a92e4133479a4aeae37cb"
//         }
//     ],
//         "shippingAddress1":"dia chi 1/a",
//         "shippingAddress2":"dia chi 2",
//         "city":"thanh pho",
//         "zip":"zip code1",
//         "country":"quoc gia",
//         "phone1":"phone 01",
//         "phone2":"phone 2",
//         "profile":"6184f3bd59028531e2ae470b",
//         "user":"6183d25f4c0bdb3f36047224"
// }
