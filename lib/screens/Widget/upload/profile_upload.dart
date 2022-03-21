import 'package:flutter/material.dart';

import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/login_view_model.dart';

import 'package:flutter_app/consts/_list/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class ProfileUpLoad extends StatefulWidget {
  static const routeName = '/ProfileUpLoad';
  @override
  _profileUpLoadState createState() => _profileUpLoadState();
}

// ignore: camel_case_types
class _profileUpLoadState extends State<ProfileUpLoad> {
  String? value;

  List<CategoryModel> listcategory = [];

  final _fromkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  Map<String, dynamic>? data = {};

  @override
  Widget build(BuildContext context) {
    final profileUpLoadView = Provider.of<ProfileViewModel>(context);
    final _userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cập nhật thông tin'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.orange[50],
          child: Form(
            key: _fromkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Column(
                      children: [
                        textFormField(
                            nameController, 'Họ Tên', context, 'Họ Tên'),
                        textFormField(phoneController, 'Số điện thoại ',
                            context, 'Số điện thoại'),
                        textFormField(
                            streetController, 'Địa chỉ', context, 'Địa chỉ'),
                        textFormField(
                            cityController, 'Thành phố ', context, 'Thành phố'),
                        textFormField(
                            provinceController, 'Tỉnh', context, 'Tỉnh'),
                        textFormField(
                            stateController, 'Quốc Gia', context, 'Quốc Gia'),
                        ElevatedButton(
                          onPressed: () async {
                            if (_fromkey.currentState!.validate()) {
                              data = {
                                "user": _userViewModel.userModel.data!.id,
                                "name": nameController.text,
                                "phone": phoneController.text,
                                "address": {
                                  "street": streetController.text,
                                  "city": cityController.text,
                                  "province": provinceController.text,
                                  "state": stateController.text,
                                }
                              };
                              print(data);
                              await profileUpLoadView.postProfileUpLoad(data);
                              // goi lai get profile
                              var a = profileUpLoadView.profileList;
                              if (a.status!) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomAppBar(),
                                  ),
                                );
                              } else {}
                            } else {}
                          },
                          child: Text('Lưu Thông Tin'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormField(TextEditingController controller, String title,
      BuildContext context, String hintText) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              labelText: title,
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.orange, width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Colors.teal.shade300, width: 3)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red, width: 3)),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
