import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/WishList_model.dart';
import 'package:flutter_app/consts/_list/Model/cart_model.dart';
import 'package:flutter_app/screens/Widget/product_details.dart';

class WishProvider with ChangeNotifier {
  Map<String, WishModel> wishItems = {};

  Map<String, WishModel> get getWishItems {
    return {...wishItems};
  }

  // double get totalAmount {
  //   var total = 0.0;
  //   cartItems.forEach((key, value) {
  //     total += value.price * value.quantity;
  //   });
  //   return total;
  // }

  void addWishList(
    String productId,
    double price,
    String title,
    String imageUrl,
  ) {
    if (wishItems.containsKey(productId)) {
      getWishItems.update(
        productId,
        (exitingCartItem) => WishModel(
          id: exitingCartItem.id,
          productId: exitingCartItem.productId,
          title: exitingCartItem.title,
          price: exitingCartItem.price,
          // quantity: exitingCartItem.quantity,
          imageUrl: exitingCartItem.imageUrl!,
        ),
      );
    } else {
      wishItems.putIfAbsent(
        productId,
        () => WishModel(
          id: DateTime.now().toString(),
          productId: productId,
          title: title,
          price: price,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    wishItems.remove(productId);
    notifyListeners();
  }

  void clearWishListItems() {
    wishItems.clear();
    notifyListeners();
  }
}
