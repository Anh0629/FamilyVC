import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_app/bottom_bar.dart';
import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:flutter_app/consts/theme_data.dart';

import 'package:flutter_app/provider/dark_theme.dart';
import 'package:flutter_app/screens/Widget/Categori_detail.dart';
import 'package:flutter_app/screens/card.dart';
import 'package:flutter_app/screens/feeds.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/wishlist.dart';
import 'package:provider/provider.dart';

import 'screens/Widget/product_details.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
          ChangeNotifierProvider(create: (_) {
            return ProductViewModel();
          }),
          ChangeNotifierProvider(create: (_) {
            return CategoryViewModel();
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'App cua Thai Anh',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
            routes: {
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              FeedsScreen.routeName: (ctx) => FeedsScreen(),
              HomeScreen.routeName: (ctx) => HomeScreen(),
              productDetails.routeName: (ctx) => productDetails(),
              CategoryDetail.routeName: (ctx) => CategoryDetail(),
            },
          );
        }));
  }
}
