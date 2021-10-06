import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Widget/product_details.dart';

class BaocaoTuan extends StatefulWidget {
  @override
  _BaocaoTuanState createState() => _BaocaoTuanState();
}

class _BaocaoTuanState extends State<BaocaoTuan> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(productDetails.routeName),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        width: 200,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                    minHeight: 60,
                    maxHeight: MediaQuery.of(context).size.height * 0.2),
                child: Image.asset(
                  'assets/images/healthyfood.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
