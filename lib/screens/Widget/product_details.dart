// import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/consts/theme_data.dart';
// import 'package:flutter_app/main.dart';
import 'package:flutter_app/provider/dark_theme.dart';
import 'package:flutter_app/screens/card.dart';
import 'package:flutter_app/screens/wishlist.dart';
import 'package:provider/provider.dart';

// ignore: unused_import

import 'package:list_tile_switch/list_tile_switch.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết Sản Phẩm'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(15),
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
                                'title',
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text('data')
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
                                'description',
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).textSelectionColor),
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
                            details(
                                themeState.darkTheme, 'Brand: ', 'BrandName'),
                            details(themeState.darkTheme, 'Quantily: ', '12'),
                            details(themeState.darkTheme, 'Category: ', 'Name'),
                            details(themeState.darkTheme, 'Popularity: ',
                                'Popularity'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
              color: Theme.of(context).textSelectionColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            inf,
            // ignore: deprecated_member_use
            style: TextStyle(
              color: Theme.of(context).textSelectionColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
