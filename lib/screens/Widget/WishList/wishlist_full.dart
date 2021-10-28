import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/WishList_model.dart';
import 'package:flutter_app/consts/_list/utils/global_method.dart';
import 'package:flutter_app/consts/_list/view_model/wishList_view_model.dart';
import 'package:flutter_app/provider/dark_theme.dart';
import 'package:flutter_app/screens/Widget/product_details.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';

class WishlistFullScreen extends StatefulWidget {
  final String? productId;

  const WishlistFullScreen({
    this.productId,
  });

  @override
  _WishlistFullScreenState createState() => _WishlistFullScreenState();
}

class _WishlistFullScreenState extends State<WishlistFullScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethod = GlobalMethods();

    final themeChange = Provider.of<DarkThemeProvider>(context);
    final wishProvider = Provider.of<WishProvider>(context);
    final wishAttributes = Provider.of<WishModel>(context);

    // double subtotal = cartAttributes.price * cartAttributes.quantity;

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        productDetails.routeName,
        arguments: widget.productId,
      ),
      child: Container(
        color: Theme.of(context).primaryColorLight,
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
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    width: 2, color: Theme.of(context).primaryColorLight),
                image: DecorationImage(
                  // image: NetworkImage(cartAttributes.imageUrl!),
                  image: AssetImage(wishAttributes.imageUrl!),
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
                              wishAttributes.title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
                                  Feather.x_circle,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                              onTap: () {
                                globalMethod.showDialogg(
                                    'title',
                                    'subTitle',
                                    () => wishProvider
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
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${wishAttributes.price} \$',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   children: [
                    // Text(
                    //   'Sub Total: ',
                    //   // ignore: deprecated_member_use
                    //   style: TextStyle(
                    //       // ignore: deprecated_member_use
                    //       color: Theme.of(context).textSelectionColor),
                    // ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // FittedBox(
                    //   child: Text(
                    //     'data',
                    //     // '${subtotal.toStringAsFixed(2)} \$',
                    //     style: TextStyle(
                    //       // fontSize: 16,
                    //       fontWeight: FontWeight.w600,
                    //       color: themeChange.darkTheme
                    //           ? Colors.brown[700]
                    //           // ignore: deprecated_member_use
                    //           : Theme.of(context).textSelectionColor,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // SizedBox(
                //   height: 5,
                // ),
                // Row(
                //   children: [
                //     Text(
                //       'Ships Free',
                //       style: TextStyle(
                //         fontSize: 16,
                //         color: themeChange.darkTheme
                //             ? Colors.brown.shade900
                //             : Theme.of(context).accentColor,
                //       ),
                //     ),
                //   ],
                // ),
                //],
              ),
            ),
            //),
          ],
        ),
      ),
    );
  }
}
