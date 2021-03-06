import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/consts/_list/Model/product_error.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/repo/category_services.dart';
import 'package:flutter_app/consts/_list/repo/postCategory.dart';

class CategoryViewModel extends ChangeNotifier {
  bool _loading = false;
  List<CategoryModel> _categoryListModel = [];
  Error? _error;

  bool get loading => _loading;
  List<CategoryModel> get categoryList => _categoryListModel;
  Error get categoryError => _error!;

  CategoryViewModel() {
    getCategory();
    print("CategoryViewModel constructor");
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setCategoryListModel(List<CategoryModel> categoryListModel) async {
    _categoryListModel = categoryListModel;
  }

  setCategoryError(Error error) {
    _error = error;
  }

  getCategory() async {
    setLoading(true);

    var response = await CategoryService.fetchCategory();

    if (response is Success) {
      setCategoryListModel(response.response as List<CategoryModel>);
    }

    if (response is Failure) {
      Error categoryError =
          Error(code: response.code, message: response.errorResponse);

      setCategoryError(categoryError);
    }

    setLoading(false);
  }

  postCategory(var data )async{
    var response = await PostCategory.fetch(data!);
    if(response is Success){
      setCategoryListModel(response.response as List<CategoryModel>);
    }
    if(response is Failure){
       Error categoryError =
          Error(code: response.code, message: response.errorResponse);
          setCategoryError(categoryError);
    }
  }

  deleteCategory(String? idcategory) async{
    var response = await CategoryService.fetchDelete(idcategory!);
    if(response is Success){
      setCategoryListModel(response.response as List<CategoryModel>);
    } 
    if(response is Failure){
      Error categoryError= Error(code: response.code, message: response.errorResponse);
      setCategoryError(categoryError);
    }
  }

  CategoryModel findById(String categoryId) {
    return categoryList.firstWhere((element) => element.id == categoryId);
  }
}
