import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/repo/middleware_postUser.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  UserPostMidd _userPostMidd = new UserPostMidd();
  UserPostMidd get userPostMidd => _userPostMidd;

  setUserPostMidd(UserPostMidd userPostMidd) async {
    _userPostMidd = userPostMidd;
  }

  Future googleLogin(BuildContext context) async {
    // doi dang nhap
    final googUser = await googleSignIn.signIn();
    if (googUser == null) return;

    _user = googUser;
    // xac thuc
    final googAuth = await googUser.authentication;
    // cung cap chung chi token
    final credential = GoogleAuthProvider.credential(
      accessToken: googAuth.accessToken,
      idToken: googAuth.idToken,
    );
    final user = await FirebaseAuth.instance.signInWithCredential(credential);
    print('user ---------------------');
    print(user.additionalUserInfo?.isNewUser);

    if (user.additionalUserInfo?.isNewUser == true) {
      final idToken = await user.user?.getIdToken(); // lay token
      print(idToken);
      // userPostMiddleware(var token)async{
      //   var response = await UserPostMidd.userpostmidd(token);
      //   if(response is Success){
      //     return setUserPostMidd(response.response as UserPostMidd);

      //   }
      //   if(response is Failure){
      //     return 'Wrong';
      //   }
      // }
      // Map<String, dynamic> data = {};

      // data = {
      //   "username": _user!.displayName,
      //   "email": _user!.email,
      //   "isAdmin": false,
      // };
      await UserPostMidd.userpostmidd(idToken.toString());
      print(_user!.email);
      print(_user!.displayName);
    } else {
      final idToken = await user.user?.getIdToken(); // lay token
      log(idToken!);
    }
  }

  notifyListeners();
}
