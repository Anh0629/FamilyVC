import 'package:flutter/material.dart';
//import 'package:flutter_app/consts/_list/Model/product_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:provider/provider.dart';

import 'Widget/Feeds_products.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/FeedsScreen';
  @override
  Widget build(BuildContext context) {
    ProductViewModel productsViewModel = Provider.of<ProductViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mua Sắm nào!'),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.only(top: 5.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 200 / 280,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(
            productsViewModel.productList.length,
            (index) {
              return ChangeNotifierProvider.value(
                value: productsViewModel.productList[index],
                child: FeedProducts(),
              );
            },
          ),
        ),
      ),
    );
  }
}
