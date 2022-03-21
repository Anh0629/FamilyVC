import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/utils/global_method.dart';
import 'package:flutter_app/consts/_list/view_model/wishList_view_model.dart';
import 'package:flutter_app/screens/Widget/WishList/wishlist_full.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'wishlist_empty.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    final wishProvider = Provider.of<WishProvider>(context);
    // final wishAttributes = Provider.of<WishModel>(context);
    GlobalMethods globalMethod = GlobalMethods();

    return wishProvider.getWishItems.isEmpty
        ? Scaffold(body: WishListEmpty())
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                'Yêu Thích (${wishProvider.getWishItems.length})',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Feather.trash),
                  onPressed: () {
                    globalMethod.showDialogg(
                      'Xoá Hết',
                      'Bạn chắc chắn xoá tất cả!',
                      () => wishProvider.clearWishListItems(),
                      context,
                    );
                  },
                )
              ],
            ),
            body: Container(
              color: Theme.of(context).backgroundColor,
              // margin: const EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemCount: wishProvider.getWishItems.length,
                itemBuilder: (BuildContext ctx, int idx) {
                  return ChangeNotifierProvider.value(
                    value: wishProvider.getWishItems.values.toList()[idx],
                    child: WishlistFullScreen(
                      productId: wishProvider.getWishItems.keys.toList()[idx],
                    ),
                  );
                },
              ),
            ),
          );
  }
}
