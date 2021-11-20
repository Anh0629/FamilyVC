import 'package:flutter/material.dart';
// import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
// import 'package:flutter_app/consts/_list/Model/product_list_model.dart';
// import 'package:flutter_app/consts/_list/Model/product_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
// import 'package:flutter_app/screens/Widget/Feeds_products.dart';
// import 'package:flutter_app/screens/Widget/product_detail_category.dart';
import 'package:provider/provider.dart';

import 'Feeds_products.dart';
// import 'product_detail_category.dart';

class CategoryDetail extends StatefulWidget {
  static const routeName = '/CategoryDetail';

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    var categoryId = ModalRoute.of(context)!.settings.arguments.toString();

    CategoryViewModel categoryViewModel =
        Provider.of<CategoryViewModel>(context);
    ProductViewModel productViewModel = Provider.of<ProductViewModel>(context);

    final categoryAttributes = categoryViewModel.findById(categoryId);
    final productListByCategory = productViewModel.findByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryAttributes.name),
        centerTitle: true,
      ),
      body: productListByCategory.isEmpty
          ? Container(
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.only(top: 5.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 100,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'No products related to this category, yet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.only(top: 8),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 250 / 370,
                children: List.generate(
                  productListByCategory.length,
                  (index) {
                    return ChangeNotifierProvider.value(
                      value: productListByCategory[index],
                      child: FeedProducts(),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
