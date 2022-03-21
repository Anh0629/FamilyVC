

import 'package:flutter/material.dart';

import 'package:flutter_app/screens/Widget/User/user_patchPassword.dart';
import 'package:flutter_app/screens/Widget/upload/profile_upload.dart';

// import 'package:provider/provider.dart';

// import '../../../consts/_list/view_model/login_view_model.dart';

class DecentralizeUser extends StatefulWidget {
  static const routerName = '/DecentralizeUser';
  @override
  _DecentralizeUserState createState() => _DecentralizeUserState();
}

class _DecentralizeUserState extends State<DecentralizeUser> {
  @override
  Widget build(BuildContext context) {
    
    //inal _userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          userTitle('User: '),
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Theme.of(context).primaryColorLight,
                onTap: () =>
                    Navigator.of(context).pushNamed(ProfileUpLoad.routeName),
                child: Column(children: [
                  Divider(
                    thickness: 2,
                    endIndent: 100,
                    color: Colors.black,
                  ),
                  ListTile(
                    title: Text('Thêm thông tin người dùng',
                        style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 16,
                            fontWeight: FontWeight.w900)),
                    trailing: Icon(Icons.chevron_right_rounded),
                    // leading: Icon(),
                  ),
                ]),
              ),
            ),
          ),
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Theme.of(context).primaryColorLight,
                onTap: () =>
                    {Navigator.of(context).pushNamed(UserPatch.routerName)},
                child: Column(children: [
                  Divider(
                    thickness: 2,
                    endIndent: 100,
                    color: Colors.black,
                  ),
                  ListTile(
                    title: Text('thay đổi Password user >>>',
                        style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 16,
                            fontWeight: FontWeight.w900)),
                    trailing: Icon(Icons.chevron_right_rounded),
                    // leading: Icon(),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget userListTitle(String title, int index, BuildContext context,
    {VoidCallback? onTap, String? subTitle}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      splashColor: Theme.of(context).primaryColorLight,
      child: ListTile(
        onTap: onTap,
        title: Text(title,
            style: TextStyle(color: Theme.of(context).primaryColorLight)),
        subtitle: Text(
          subTitle ?? '',
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
        leading: Icon(
          userTitleIcons[index],
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    ),
  );
}

Widget userTitle(String title) {
  
  return Container(
    
    child: Text(
      title,
      style: TextStyle(
         
          fontWeight: FontWeight.bold,
          fontSize: 24,
          height: 2,
          color: Colors.black,
          
          ),
    ),
  );
}

List<IconData> userTitleIcons = [
  Icons.email,
  Icons.phone,
  Icons.local_shipping,
  Icons.person,
  Icons.exit_to_app_rounded,
];
