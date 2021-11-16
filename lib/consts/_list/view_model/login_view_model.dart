import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/product_error.dart';
import 'package:flutter_app/consts/_list/Model/user_model.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/repo/user_services.dart';

class UserViewModel with ChangeNotifier {
  bool _loading = false;
  UserModel _userModel = new UserModel();
  Error? _error;

  bool get loading => _loading;
  UserModel get userModel => _userModel;
  Error get productError => _error!;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setLoginListModel(UserModel userModel) async {
    _userModel = userModel;
  }

  setLoginError(Error error) {
    _error = error;
  }

  setUserGetIdListModel(UserModel userModel) async {
    _userModel = userModel;
  }

  setUserGetIdError(Error error) {
    _error = error;
  }

  userLogin(var body) async {
    setLoading(true);

    var response = await UserServices.userLogin(body);

    if (response is Success) {
      return setLoginListModel(response.response as UserModel);
    }

    if (response is Failure) {
      Error productError =
          Error(code: response.code, message: response.errorResponse);

      setLoginError(productError);
    }

    setLoading(false);
    notifyListeners();
  }
}
