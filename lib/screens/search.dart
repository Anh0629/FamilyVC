import 'package:flutter/material.dart';
// import 'package:flutter_app/consts/theme_data.dart';
// import 'package:flutter_app/screens/Widget/Feeds_products.dart';
// import 'package:flutter_app/screens/Widget/product_details.dart';

// import 'Widget/BaocaoTuan.dart';
// import 'Widget/shop_home.dart';

class SearchScreen extends StatelessWidget {
  Stream<int> stream() {
    Duration delayTime = Duration(seconds: 5);
    Stream<int> stream = Stream<int>.periodic(delayTime, makeNumber);
    return stream;
  }

  int makeNumber(int value) => (value + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 50),
      child: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text('Hoàn thành điều kiện 1');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Hoàn thành điều kiện 2');
          }
          return Text(
            'Giá trị mặc định',
          );
        },
        initialData: 0,
        // đầu vào là stream
        stream: stream(),
      ),
    ));
  }
}
