import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/product_list_model.dart';

// import 'package:flutter_app/consts/products_list/view_model/products_view_model.dart';
import 'package:flutter_app/screens/Widget/product_details.dart';
import 'package:provider/provider.dart';

class FeedProductsHome extends StatefulWidget {
  @override
  _FeedProductsHomeState createState() => _FeedProductsHomeState();
}

class _FeedProductsHomeState extends State<FeedProductsHome> {
  @override
  Widget build(BuildContext context) {
    final productAttributes = Provider.of<ProductModel>(context);
    // List<ProductModel> productModel = productsViewModel.productListModel;
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        productDetails.routeName,
        arguments: productAttributes.id,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        width: 80,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                    minHeight: 50,
                    maxHeight: MediaQuery.of(context).size.height * 0.15),
                child: Image.asset(
                  'assets/images/healthyfood.png',
                  fit: BoxFit.fitWidth,
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
                    padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
                    child: Text(
                      productAttributes.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Số Lượng:' + productAttributes.countInStock.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 10,
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
    );
  }

// Widget ProductModelDetail findById(String id){
//   return
// };

}
