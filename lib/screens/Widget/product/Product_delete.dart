import 'package:flutter/material.dart';

class ProductDeleteScreen extends StatefulWidget{
  static const routerName = '/ProductDeleteScreen';
  @override
  _ProductDeleteScreenState createState() => _ProductDeleteScreenState();

}

class _ProductDeleteScreenState extends State<ProductDeleteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: Text("Delete Product ")),
      body: Container(
        padding: const EdgeInsets.all(.0),
        color: Theme.of(context).primaryColorLight,
        child: Column(children: [

        ]),
      ),
    );
  }
}