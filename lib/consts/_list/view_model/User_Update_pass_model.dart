import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/product_error.dart';
import 'package:flutter_app/consts/_list/repo/user_update_PatchPass.dart';
import '../Model/user_update_Password.dart';
import '../repo/api_status.dart';

class UserUpdatePassModel with ChangeNotifier {
  UserUpdatePassword _userUp = UserUpdatePassword(
      email: '', id: '', isAdmin: null, passwordHash: '', username: '');
  UserUpdatePassword get userUp => _userUp;



    Error? _error;
    Error get passError => _error!;
    setPassError(Error error)
    {
    _error = error;
    }




  setPatchPass(UserUpdatePassword userUp) async {
    _userUp = userUp;
  }

  getDataPatchPass(var body, String? userId )async{

    var response = await UserPatchPass.patchdata(body,userId!);
    print(response);

    if(response is Success){
      setPatchPass(response.response as UserUpdatePassword);
    }
    if(response is Failure){
      Error passError =
          Error(code: response.code, message: response.errorResponse);
          setPassError(passError);
    }
    }
  }