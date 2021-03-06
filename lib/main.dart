// @dart=2.9
import "package:flutter/material.dart";
import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/User_Update_pass_model.dart';
import 'package:flutter_app/consts/_list/view_model/cart_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/google-login-Firebase.dart';
import 'package:flutter_app/consts/_list/view_model/login_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/profile_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/wishList_view_model.dart';
import 'package:flutter_app/consts/theme_data.dart';
import 'package:flutter_app/provider/dark_theme.dart';
import 'package:flutter_app/screens/Stream.dart';
import 'package:flutter_app/screens/Widget/Categori_detail.dart';
import 'package:flutter_app/screens/Widget/User/user_patchPassword.dart';
import 'package:flutter_app/screens/Widget/admin/admin.dart';
import 'package:flutter_app/screens/Widget/auth/login.dart';
import 'package:flutter_app/screens/Widget/order/order.dart';
import 'package:flutter_app/screens/Widget/product/Product_delete.dart';
import 'package:flutter_app/screens/Widget/upload/Product_upload.dart';
import 'package:flutter_app/screens/Widget/upload/postNewCategory.dart';
import 'package:flutter_app/screens/Widget/upload/profile_upload.dart';
import 'package:flutter_app/screens/feeds.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/Widget/WishList/wishlist.dart';
import 'package:provider/provider.dart';
import 'consts/_list/view_model/order_view_model.dart';
import 'consts/_list/view_model/signUp_view_model.dart';
import 'screens/Widget/Cart/cart.dart';
import 'screens/Widget/product_details.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {

   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          }),
          ChangeNotifierProvider(create: (_) {
            return CartProvider();
          }),
          ChangeNotifierProvider(create: (_) {
            return WishProvider();
          }),
          ChangeNotifierProvider(create: (_) {
            return ProfileViewModel();
          }),
          ChangeNotifierProvider(create: (_) {
            return UserViewModel();
          }),
          ChangeNotifierProvider(create: (_) {
            return SignUpViewModel();
          }),
          ChangeNotifierProvider(create: (_) {
            return OrderViewModel();
          }),
          ChangeNotifierProvider(create: (_) {
            return UserUpdatePassModel();
          }),
          ChangeNotifierProvider(create: (_){
            return CategoryModel(id: '', message: '', name: '', success: null);
          }),
          ChangeNotifierProvider(create:(_){
            return GoogleSignInProvider();
          }),
          ChangeNotifierProvider(create: (_){
            return GoogleSignInProvider();
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'App cua Thai Anh',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: StreamScreen(),
            routes: {
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              FeedsScreen.routeName: (ctx) => FeedsScreen(),  
              HomeScreen.routeName: (ctx) => HomeScreen(),
              productDetails.routeName: (ctx) => productDetails(),
              CategoryDetail.routeName: (ctx) => CategoryDetail(),
              LoginPage.routeName: (ctx) => LoginPage(),
              UploadProductForm.routeName: (ctx) => UploadProductForm(),
              ProfileUpLoad.routeName: (ctx) => ProfileUpLoad(),
              OrderScreen.routeName: (ctx) => OrderScreen(),
              UserPatch.routerName:(ctx)=> UserPatch(),
              NewCategory.routeName:(ctx)=>NewCategory(),
              AdminScreen.routerName:(ctx)=>AdminScreen(),
              ProductDeleteScreen.routerName:(ctx)=>ProductDeleteScreen(),
              
            },
          );
        }));
  }
}
