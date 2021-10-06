import 'package:flutter/material.dart';

import 'Widget/Feeds_products.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/FeedsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 200 / 280,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(100, (index) {
              return FeedProducts();
            })));
  }
}
