import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> cartItems = {};

  Map<String, CartModel> get getCartItems {
    return {...cartItems};
  }

  double get totalAmount {
    var total = 0.0;
    cartItems.forEach((key, value) {
      total += value.price! * value.quantity!;
    });
    return total;
  }

  void addProductToCart(
      String productId, double price, String title, String imageUrl) {
    if (cartItems.containsKey(productId)) {
      cartItems.update(
        productId,
        (exitingCartItem) => CartModel(
          id: exitingCartItem.id,
          productId: exitingCartItem.productId,
          title: exitingCartItem.title,
          price: exitingCartItem.price,
          quantity: exitingCartItem.quantity! + 1,
          imageUrl: exitingCartItem.imageUrl!,
        ),
      );
    } else {
      cartItems.putIfAbsent(
        productId,
        () => CartModel(
          id: DateTime.now().toString(),
          productId: productId,
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void reduceItemByOne(String productId) {
    if (cartItems.containsKey(productId)) {
      cartItems.update(
        productId,
        (exitingCartItem) => CartModel(
          id: exitingCartItem.id,
          productId: exitingCartItem.productId,
          title: exitingCartItem.title,
          price: exitingCartItem.price,
          quantity: exitingCartItem.quantity! - 1,
          imageUrl: exitingCartItem.imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    cartItems.remove(productId);
    notifyListeners();
  }

  void clearCartItems() {
    cartItems.clear();
    notifyListeners();
  }
}
