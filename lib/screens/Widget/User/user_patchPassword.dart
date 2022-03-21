// ignore_for_file: unused_label



import 'package:flutter/material.dart';

import 'package:flutter_app/screens/Widget/order/order.dart';
import 'package:provider/provider.dart';
import '../../../consts/_list/view_model/User_Update_pass_model.dart';
import '../../../consts/_list/view_model/login_view_model.dart';

class UserPatch extends StatefulWidget {
  const UserPatch({Key? key}) : super(key: key);
  static const routerName = "/UserPatch";

  @override
  _UserPatchState createState() => _UserPatchState();
}

class _UserPatchState extends State<UserPatch> {
  var body;
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _userViewModel = Provider.of<UserViewModel>(context);
    final _userUpdatePassModel= Provider.of<UserUpdatePassModel>(context);
    // ignore: unused_local_variable

    final _user ;
    _user = _userViewModel.userModel.data!.email.toString();



    final TextEditingController passController = TextEditingController();
    final TextEditingController passCurrendController = TextEditingController();
    



    return Scaffold(
        appBar: AppBar(title: Text("Doi mat khau")),
        body: Container(
            child: SingleChildScrollView(
          child: Form(key: _formKey,
          child: Column(
            children: [
              textFieldWidget(passCurrendController, "Password hiện tại", context),
              textFieldWidget(passController, "Nhập Password mới!", context),
              ElevatedButton(onPressed: ()async{
                Map<dynamic, dynamic> dataPass = {};
                if(_formKey.currentState!.validate()){
                  dataPass = {
                    "currentPassword": passCurrendController.text,
                    "password": passController.text,
                    
                  };
                 await _userUpdatePassModel.getDataPatchPass( dataPass, _user);
                }
              },
               child: text('Change Password'))
            ],
            
          )),
        )));
  }
}

Widget textFieldWidget(
    TextEditingController controller, String hintText, BuildContext context) {
  // bool visi = false;
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter something';
        }
        return null;
      },
      // obscureText: obscureText ? visi : false,
      decoration: InputDecoration(
          // suffixIcon: suffixIcon
          //     ? IconButton(
          //         // ignore: dead_code
          //         icon: Icon(visi ? Icons.visibility_off : Icons.visibility),
          //         onPressed: () {
          //           setState(() {
          //             visi = !visi;
          //           });
          //         },
          //       )
          //     : null,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red))),
    ),
  );
}

void setState(Null Function() param0) {}
