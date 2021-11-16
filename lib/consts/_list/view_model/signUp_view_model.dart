import 'package:flutter_app/consts/_list/Model/product_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/user_model.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/repo/user_signup_services.dart';

class SignUpViewModel with ChangeNotifier {
  bool _loading = false;
  UserModel _userModel = UserModel();
  Error? _error;

  bool get loading => _loading;
  UserModel get userModel => _userModel;
  Error get productError => _error!;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setSignUpListModel(UserModel userModel) {
    _userModel = userModel;
  }

  setSignUpError(Error error) {
    _error = error;
  }

  userSignUp(var body) async {
    setLoading(true);
    var response = await UserSignUpServices.userSignUp(body);
    print(response);
    print('respon userSignUp');

    if (response is Success) {
      return setSignUpListModel(response.response as UserModel);
    }
    print(UserModel);
    if (response is Failure) {
      Error productError =
          Error(code: response.code, message: response.errorResponse);
      setSignUpError(productError);
    }

    setLoading(false);
    notifyListeners();
  }
}
