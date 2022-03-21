// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/bottom_bar.dart';
import 'package:flutter_app/consts/_list/view_model/login_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/profile_view_model.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  Map<String, String> data = {};

  bool validate = false;
  bool vis = true;

  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);
    final _profileViewModdel = Provider.of<ProfileViewModel>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.only(top: 100),
              color: Colors.orange[50],
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Text("Family-VC",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 30,
                          fontWeight: FontWeight.w700)),
                  Container(
                    child: Image.asset(
                      'assets/images/giphy3.gif',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  textFieldWidget(
                    _emailController,
                    "Email or Username",
                    false,
                    false,
                  ),
                  textFieldWidget(
                    _pwdController,
                    "Password",
                    true,
                    true,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _userViewModel.userLogin(data);

                        final a = _userViewModel.userModel;
                        print(a);
                        print(data);

                        if (a.status!) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomBarScreen(),
                            ),
                          );
                          await _profileViewModdel.getProflile(a.data!.id);
                        } else {
                          final snackBar = SnackBar(
                            content: Text(a.message!),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange[300],
                      side: BorderSide(color: Colors.white, width: 3),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldWidget(TextEditingController controller, String hintText,
      bool obscureText, bool suffixIcon) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter something';
          } else {
            if (value.contains("@") && hintText.contains("Email")) {
              data = {
                "email": _emailController.text,
                "password": _pwdController.text,
              };
            } else if (!value.contains("@") && hintText.contains("Email")) {
              data = {
                "username": _emailController.text,
                "password": _pwdController.text,
              };
            }
          }
          return null;
        },
        obscureText: obscureText ? vis : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon
              ? IconButton(
                  icon: Icon(
                    vis ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      vis = !vis;
                    });
                  },
                )
              : null,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromARGB(255, 17, 0, 255), width: 3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.teal.shade300, width: 3)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromARGB(255, 54, 244, 70), width: 3)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 3),
          ),
        ),
      ),
    );
  }
}
