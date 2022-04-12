// import 'dart:async';

// import 'package:flutter_app/screens/Widget/auth/valida/validations.dart';

// class LoginBlogC {
//   StreamController _streamControllerUser = StreamController();
//    StreamController _streamControllerPass = StreamController();

// Stream get getuserStream => _streamControllerUser.stream;
// // 2 casi nay giong nhau
// Stream getStreamPass(){
//   return _streamControllerPass.stream;
// }


//  bool isvalidIf(String user, String pass){
//    if(!Validations.isvaliUser(user)){
//      _streamControllerUser.sink.addError('err');
//      return false;
//    }
//    if(!Validations.isvaliPass(pass)){
//      _streamControllerPass.sink.addError('error');
//     return false;
//    }

//    _streamControllerUser.add('da add');
//    _streamControllerPass.add('add');
//    return true;
//  }
//  void dispose(){
//    _streamControllerUser.close();
//    _streamControllerPass.close();
//  }
// }