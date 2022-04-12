

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_app/consts/_list/view_model/google-login-Firebase.dart';
// import 'package:flutter_app/consts/_list/view_model/signUp_view_model.dart';
// import 'package:flutter_app/screens/user.dart';
// import 'package:provider/provider.dart';

// class PostuserGoogle extends StatefulWidget {
//   @override
//   _PostuserGoogleState createState() => _PostuserGoogleState();
// }

// class _PostuserGoogleState extends State<PostuserGoogle> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: futureBuilder(context),
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           print('snapshort');
//           if (snapshot.hasData) {
            
//           return  snapshot.data;
          
          
//           }if(snapshot.hasError){
//             return Center(child: Text('err'));
//           }
//           return Center(child: Text('khong co du lieu'));
//         });
//   }
// }

// Future<Widget> futureBuilder(BuildContext context) async {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//    final User user = auth.currentUser!;
  
//   Map<String, dynamic>? data = {};
//   user.getIdToken();
 
//   if (user.metadata.creationTime) {
//    data = {
//       "username": _googleSignInProvider.user.displayName,
//       "email": _googleSignInProvider.user.email,
//       "passwordHash": _googleSignInProvider.user.id,
//       "isAdmin": false,
//     }; 
//     await _userSignUpViewModel.userSignUp(data);
//     print('thuc thi data len post');
//   }
//   print('cha ve userScreen');
//   return UserScreen();
// }
