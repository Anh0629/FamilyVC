// import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/consts/_list/Model/product_list_model.dart';

import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
// import 'package:flutter_app/consts/_list/Model/product_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:flutter_app/provider/dark_theme.dart';
import 'package:fluttericon/elusive_icons.dart';
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

    final product = productViewModel.findById(productId);
    final productListByCategory =
        productViewModel.findByCategory(product.category.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.category.name),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(0),
            // color: Colors.black,
            child: Container(
              padding: const EdgeInsets.all(16),
              foregroundDecoration: BoxDecoration(color: Colors.transparent),
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/healthyfood.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Material(
                          color: Colors.indigo[200],
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            splashColor: Colors.white,
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
                      Material(
                        color: Colors.indigo[200],
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(50),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.local_car_wash_outlined,
                              size: 23,
                              color: Colors.indigo[900],
                            ),
                          ),
                        ),
                      )
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
                  color: Colors.white,
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
                                      color: Theme.of(context).splashColor)),
                            ),
                            // SizedBox(
                            //   height: 8,
                            // ),
                            // Text('data')
                          ],
                        ),
                      )
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
                  color: Theme.of(context).backgroundColor,
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
                                'Miêu tả: ' + product.description,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
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
                  height: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Sản phẩm liên quan',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).splashColor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 310,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productListByCategory.length < 7
                        ? productListByCategory.length
                        : 7,
                    itemBuilder: (BuildContext ctx, int idx) {
                      // if (productListByCategory[idx].name == product.name) {
                      //   return productListByCategory.sublist(1).toList();
                      // }
                      return ChangeNotifierProvider.value(
                        value: productListByCategory[idx],
                        child: FeedProducts(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Elusive.heart),
                tooltip: 'Yêu thích',
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Zocial.cart)),
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
