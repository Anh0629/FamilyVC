


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
final googleSignIn = GoogleSignIn();
GoogleSignInAccount? _user;
GoogleSignInAccount get user => _user!;

Future googleLogin()async{
  // doi dang nhap
  final googUser = await googleSignIn.signIn();
  if(googUser == null) return;

  _user = googUser;
  // xac thuc
  final googAuth = await googUser.authentication;
  // cung cap chung chi token
  final credential = GoogleAuthProvider.credential(
    accessToken: googAuth.accessToken,
    idToken: googAuth.idToken,
  );

  await FirebaseAuth.instance.signInWithCredential(credential);
  notifyListeners();
}

}
