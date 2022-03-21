import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter_app/screens/Widget/User/user_witget.dart';
import 'package:flutter_app/screens/Widget/upload/postNewCategory.dart';

import '../product/Product_delete.dart';
import '../upload/Product_upload.dart';

class AdminScreen extends StatefulWidget {
  static const routerName = '/AdminScreen';
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(children: [
        Container(
          color: Theme.of(context).backgroundColor,
          child: Text(
            'admin',
            textAlign: TextAlign.right,
            style: TextStyle(
              
                color: Theme.of(context).primaryColorLight,
                fontSize: 25,
                fontWeight: FontWeight.bold,),
          ),
        ),
        Container(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Theme.of(context).primaryColorLight,
              onTap: () =>
                  Navigator.of(context).pushNamed(NewCategory.routeName),
              child: Column(children: [
                ListTile(
                  title: Text('Thêm category',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w900)),
                  trailing: Icon(Icons.chevron_right_rounded),
                  // leading: Icon(),
                ),
              ]),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Theme.of(context).primaryColorLight,
            onTap: () => {
              Navigator.of(context).pushNamed(UploadProductForm.routeName),
            },
            child: ListTile(
              title: Text('Thêm sản Phẩm',
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w900)),
              trailing: Icon(Icons.chevron_right_rounded),
              // leading: Icon(),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Theme.of(context).primaryColorLight,
            onTap: () => {
              Navigator.of(context).pushNamed(ProductDeleteScreen.routerName),
            },
            child: ListTile(
              title: Text('Xóa sản Phẩm',
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w900)),
              trailing: Icon(Icons.chevron_right_rounded),
              // leading: Icon(),
            ),
          ),
        ),
      ]),
    );
  }
}
