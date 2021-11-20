import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/cart_model.dart';
import 'package:flutter_app/consts/_list/utils/global_method.dart';
import 'package:flutter_app/consts/_list/view_model/cart_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:flutter_app/provider/dark_theme.dart';
import 'package:flutter_app/screens/Widget/product_details.dart';
import 'package:flutter_icons/flutter_icons.dart' show Entypo;
import 'package:provider/provider.dart';

class CartFullScreen extends StatefulWidget {
  final String? productId;

  const CartFullScreen({
    this.productId,
  });

  @override
  _CartFullScreenState createState() => _CartFullScreenState();
}

class _CartFullScreenState extends State<CartFullScreen> {
  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    GlobalMethods globalMethod = GlobalMethods();

    final themeChange = Provider.of<DarkThemeProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final cartAttributes = Provider.of<CartModel>(context);
    final productProvider = Provider.of<ProductViewModel>(context);

    final productAttributes = productProvider.findById(widget.productId!);

    // double subtotal = cartAttributes.price * cartAttributes.quantity;

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        productDetails.routeName,
        arguments: widget.productId,
      ),
      child: Container(
        height: 135,
        margin: const EdgeInsets.all(10),
        // padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).backgroundColor,
            border: Border.all(
                width: 2, color: Theme.of(context).primaryColorLight)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(5.0),
              width: 130,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: AssetImage(cartAttributes.imageUrl!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              cartAttributes.title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: themeChange.darkTheme
                                    ? Colors.white
                                    // ignore: deprecated_member_use
                                    : Colors.black,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Icon(
                                  Entypo.cross,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                              onTap: () {
                                globalMethod.showDialogg(
                                    'Xoá Sản Phẩm ',
                                    'Bạn Chắc chắn xoá sản phẩm này ! ',
                                    () => cartProvider
                                        .removeItem(widget.productId!),
                                    context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Price: ',
                          style: TextStyle(
                            color: themeChange.darkTheme
                                ? Colors.white
                                // ignore: deprecated_member_use
                                : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${cartAttributes.price} \$',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: themeChange.darkTheme
                                ? Colors.red[100]
                                // ignore: deprecated_member_use
                                : Colors.red[400],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sub Total: ',
                          // ignore: deprecated_member_use
                          style: TextStyle(
                            color: themeChange.darkTheme
                                ? Colors.white
                                // ignore: deprecated_member_use
                                : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            'data',
                            // '${subtotal.toStringAsFixed(2)} \$',
                            style: TextStyle(
                              // fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  // ignore: deprecated_member_use
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Ships Free',
                          style: TextStyle(
                            fontSize: 16,
                            color: themeChange.darkTheme
                                ? Colors.brown.shade900
                                : Theme.of(context).accentColor,
                          ),
                        ),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              height: 35,
                              width: 35,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.minus,
                                  color: cartAttributes.quantity! < 2
                                      ? Colors.grey
                                      : Colors.redAccent,
                                  size: 22,
                                ),
                              ),
                            ),
                            onTap: cartAttributes.quantity! < 2
                                ? () {}
                                : () {
                                    cartProvider.reduceItemByOne(
                                      widget.productId!,
                                    );
                                  },
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cartAttributes.quantity.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.plus,
                                  color: cartAttributes.quantity! >=
                                          productAttributes.countInStock
                                      ? Colors.red
                                      : Colors.greenAccent,
                                  size: 22,
                                ),
                              ),
                            ),
                            onTap: cartAttributes.quantity! >=
                                    productAttributes.countInStock
                                ? () {}
                                : () {
                                    cartProvider.addProductToCart(
                                      widget.productId!,
                                      cartAttributes.price!,
                                      cartAttributes.title!,
                                      cartAttributes.imageUrl!,
                                    );
                                  },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
