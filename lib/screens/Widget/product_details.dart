// import 'dart:ffi';

//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/consts/_list/Model/product_list_model.dart';

// ignore: unused_import
import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/cart_view_model.dart';
// import 'package:flutter_app/consts/_list/Model/product_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/wishList_view_model.dart';
//import 'package:flutter_app/consts/colors.dart';
import 'package:flutter_app/provider/dark_theme.dart';
import 'package:flutter_icons/flutter_icons.dart';
// ignore: unused_import
import 'package:fluttericon/elusive_icons.dart';
// ignore: unused_import
import 'package:fluttericon/zocial_icons.dart';
import 'package:provider/provider.dart';

import 'Feeds_products.dart';

// ignore: camel_case_types
class productDetails extends StatefulWidget {
  static const routeName = '/productDetails';

  @override
  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends State<productDetails> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    //final productget = Provider.of<ProductModel>(context);
    var productId = ModalRoute.of(context)!.settings.arguments.toString();

    // CategoryViewModel categoryViewModel =
    //     Provider.of<CategoryViewModel>(context);
    ProductViewModel productViewModel = Provider.of<ProductViewModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final product = productViewModel.findById(productId);
    final productListByCategory =
        productViewModel.findByCategory(product.category.id);

    final List<ProductModel> productFilter = productListByCategory
        .where((element) => element.id != productId)
        .toList();

    final wishProvider = Provider.of<WishProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.category.name),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: <Widget>[
            Container(
              color: Theme.of(context).backgroundColor,

              // color: Colors.black,
              child: Container(
                color: Theme.of(context).backgroundColor,
                foregroundDecoration: BoxDecoration(color: Colors.transparent),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/healthyfood.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 1.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8),

                            // nut chia se
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.indigo),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Material(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  splashColor: Colors.red,
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(50),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.share,
                                      size: 23,
                                      color: Colors.indigo[900],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.indigo,
                          height: 1,
                        )),
                    Container(
                      color: Colors.orange[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                      // 'title',
                                      product.name,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Theme.of(context).splashColor)),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                // Text('data')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[700],
                      height: 1,
                    ),
                    Container(
                      color: Colors.orange[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    // productget.description,
                                    'Mô tả: ' + product.description,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            // ignore: deprecated_member_use
                                            Theme.of(context).splashColor),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.indigo,
                                    height: 1,
                                  ),
                                ),
                                details(themeState.darkTheme, 'Số Lượng: ',
                                    product.countInStock.toString()),
                                details(themeState.darkTheme, 'Category: ',
                                    product.category.name),
                                Padding(padding: EdgeInsets.all(5.0)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[700],
                      height: 5,
                    ),
                    Container(
                      color: Theme.of(context).primaryColorLight,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(children: [
                          Text(
                            'Sản Phẩm Liên Quan',
                            style: TextStyle(
                                color:
                                    // ignore: deprecated_member_use
                                    Theme.of(context).backgroundColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      width: double.infinity,
                      height: 280,
                      color: Theme.of(context).backgroundColor,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            productFilter.length < 7 ? productFilter.length : 7,
                        itemBuilder: (BuildContext ctx, int idx) {
                          // if (productListByCategory[idx].name == product.name) {
                          //   return productListByCategory.sublist(1).toList();
                          // }
                          return ChangeNotifierProvider.value(
                            value: productFilter[idx],
                            child: FeedProducts(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Theme.of(context).primaryColorLight,
          child: Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(style: BorderStyle.none),
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.transparent,
                  ),
                ),
                child: Text(
                  cartProvider.getCartItems.containsKey(productId)
                      ? 'Đã Thêm sản phẩm'
                      : 'Thêm sản phẩm',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onPressed: cartProvider.getCartItems.containsKey(productId)
                    ? null
                    : () {
                        cartProvider.addProductToCart(
                          productId,
                          double.parse(product.price),
                          product.name,
                          'assets/images/healthyfood.png',
                        );
                      },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(style: BorderStyle.none),
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.transparent,
                  ),
                ),
                child: Icon(
                  wishProvider.getWishItems.containsKey(productId)
                      ? Entypo.heart
                      : Entypo.heart_outlined,
                  color: Theme.of(context).buttonColor,
                ),
                onPressed: wishProvider.getWishItems.containsKey(productId)
                    ? null
                    : () {
                        wishProvider.addWishList(
                          productId,
                          double.parse(product.price),
                          product.name,
                          'assets/images/healthyfood.png',
                        );
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget details(bool themeState, String title, String inf) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        children: [
          Text(
            title,
            // ignore: deprecated_member_use
            style: TextStyle(
              color: Theme.of(context).splashColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            inf,
            // ignore: deprecated_member_use
            style: TextStyle(
              color: Theme.of(context).splashColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
