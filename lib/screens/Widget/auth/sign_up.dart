// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/view_model/signUp_view_model.dart';
import 'package:flutter_app/screens/Widget/auth/login.dart';

import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  bool validate = false;
  bool vis = false;

  Map<String, dynamic>? data = {};

  @override
  Widget build(BuildContext context) {
    final _userSignUpViewModel = Provider.of<SignUpViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SignUp'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.orange[50],
          height: MediaQuery.of(context).size.height * 1,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  textFieldWidget(
                    _usernameController,
                    "Username",
                    false,
                    false,
                  ),
                  textFieldWidget(
                    _emailController,
                    "Email ",
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
                        data = {
                          "username": _usernameController.text,
                          "email": _emailController.text,
                          "password": _pwdController.text,
                          "isAdmin": false,
                        };
                        print(data);
                        print('a');

                        await _userSignUpViewModel.userSignUp(data);
                        final a = _userSignUpViewModel.userModel;
                        print(_userSignUpViewModel.userModel);

                        if (a.status!) {
                          print('signup ok');
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false,
                          );
                        } else {
                          print('sign up k dc');
                        }
                      } else {
                        final snackBar = SnackBar(
                          content: Text("Please check on Checkbox"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text("Register"),
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
          }
        },
        obscureText: obscureText ? vis : false,
        decoration: InputDecoration(
            suffixIcon: suffixIcon
                ? IconButton(
                    icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        vis = !vis;
                      });
                    },
                  )
                : null,
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
}
