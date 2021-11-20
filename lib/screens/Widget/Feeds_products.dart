import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/product_list_model.dart';

// import 'package:flutter_app/consts/products_list/view_model/products_view_model.dart';
import 'package:flutter_app/screens/Widget/product_details.dart';
import 'package:provider/provider.dart';

class FeedProducts extends StatefulWidget {
  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    final productAttributes = Provider.of<ProductModel>(context);
    // List<ProductModel> productModel = productsViewModel.productListModel;
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(productDetails.routeName, arguments: productAttributes.id),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        width: 150,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange[50],
          border:
              Border.all(width: 2, color: Theme.of(context).primaryColorLight),
        ),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColorLight),
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColorLight),
                  width: double.infinity,
                  constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: MediaQuery.of(context).size.height * 0.5),
                  child: Image.asset(
                    'assets/images/healthyfood.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Tên Sản Phẩm: ' + productAttributes.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                      child: Text(
                        // ' _:VNĐ',
                        productAttributes.price + "  VNĐ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.indigo[500],
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số Lượng:' +
                              productAttributes.countInStock.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(18.0),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
