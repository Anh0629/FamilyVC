import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/order_model.dart';
import 'package:flutter_app/consts/_list/Model/product_error.dart';

import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/repo/order_services.dart';

class OrderViewModel with ChangeNotifier {
  bool _loading = false;
  OrderModel _orderModel = OrderModel();
  Error? _error;

  bool get loading => _loading;
  OrderModel get orderModel => _orderModel;
  Error get productError => _error!;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setOrderListModel(OrderModel orderModel) {
    _orderModel = orderModel;
  }

  setOrderError(Error error) {
    _error = error;
  }

  orderIterm(var body) async {
    setLoading(true);
    var response = await OrderServices.order(body);
    print(response);
    print('respon Order');

    if (response is Success) {
      return setOrderListModel(response.response as OrderModel);
    }
    if (response is Failure) {
      Error errors =
          Error(code: response.code, message: response.errorResponse);
      setOrderError(errors);
    }

    setLoading(false);
    notifyListeners();
  }
}
