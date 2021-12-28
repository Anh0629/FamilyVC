import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/WishList_model.dart';

class WishProvider with ChangeNotifier {
  Map<String, WishModel> wishItems = {};

  Map<String, WishModel> get getWishItems {
    return {...wishItems};
  }

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
