import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/product_error.dart';
import 'package:flutter_app/consts/_list/Model/product_list_model.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/repo/product_services.dart';

class ProductViewModel with ChangeNotifier {
  bool _loading = false;
  List<ProductModel> _productListModel = [];
  Error? _error;

  bool get loading => _loading;
  List<ProductModel> get productList => _productListModel;
  Error get productError => _error!;

  ProductViewModel() {
    getProduct();
    print("ProductViewModel constructor");
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setProductListModel(List<ProductModel> productListModel) async {
    _productListModel = productListModel;
  }

  setProductError(Error error) {
    _error = error;
  }

  getProduct() async {
    setLoading(true);

    var response = await ProductService.fetchProduct();

    if (response is Success) {
      setProductListModel(response.response as List<ProductModel>);
    }
    if (response is Failure) {
      Error productError =
          Error(code: response.code, message: response.errorResponse);

      setProductError(productError);
    }

    setLoading(false);
  }

  deleteProduct(String? id) async {

    var response = await ProductDelete.fetchDelete(id!);

    if (response is Success) {
      setProductListModel(response.response as List<ProductModel>);
    }
    if (response is Failure) {
      Error productError =
          Error(code: response.code, message: response.errorResponse);

      setProductError(productError);
    }
  }

  ProductModel findById(String productId) {
    return productList.firstWhere((element) => element.id == productId);
  }

  List<ProductModel> findByCategory(String categoryId) {
    return productList
        .where((element) => element.category.id == categoryId)
        .toList();
  }

  List<ProductModel> removeItemExisting(String productId) {
    return productList.where((element) => element.id != productId).toList();
  }
}
