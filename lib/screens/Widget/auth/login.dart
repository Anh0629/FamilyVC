import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/utils/global_method.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FocusNode _passwordFocusNode = FocusNode();
  bool obscureText = true;
  String emailAddress = '';
  String password = '';
  final formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  String _emailAddress = '';
  String _password = '';
  GlobalMethods globalMethods = GlobalMethods();
  // ignore: unused_field
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      try {
        await _auth
            .signInWithEmailAndPassword(
                email: _emailAddress.toLowerCase().trim(),
                password: _password.trim())
            .then((value) =>
                Navigator.canPop(context) ? Navigator.pop(context) : null);
      } catch (error) {
        globalMethods.authErrorHandle('', context);
        print('error occured ');
      } finally {
        setState(() {
          _isLoading = false;
        });

        @override
        // ignore: unused_element
        Widget build(BuildContext context) {
          return Scaffold(
            body: Container(
              color: Colors.orange[100],
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 70),
                        child: Image.asset(
                          'assets/images/giphy3.gif',
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextFormField(
                                    key: ValueKey('email'),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    onEditingComplete: () =>
                                        FocusScope.of(context)
                                            .requestFocus(_passwordFocusNode),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        border: const UnderlineInputBorder(),
                                        filled: true,
                                        prefixIcon: Icon(Icons.email),
                                        labelText: 'Email Address',
                                        fillColor:
                                            Theme.of(context).backgroundColor),
                                    onSaved: (value) {
                                      emailAddress = value!;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextFormField(
                                    key: ValueKey('Password'),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 7) {
                                        return 'Please enter a valid Password';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode: _passwordFocusNode,
                                    decoration: InputDecoration(
                                        border: const UnderlineInputBorder(),
                                        filled: true,
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              obscureText = !obscureText;
                                            });
                                          },
                                          child: Icon(obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        ),
                                        labelText: 'Password',
                                        fillColor:
                                            Theme.of(context).backgroundColor),
                                    onSaved: (value) {
                                      password = value!;
                                    },
                                    obscureText: obscureText,
                                    onEditingComplete: _submitForm,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.teal[300]),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                side: BorderSide(
                                                    color: Theme.of(context)
                                                        .backgroundColor),
                                              ),
                                            )),
                                        onPressed: _submitForm,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Login',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Feather.user,
                                              size: 18,
                                            )
                                          ],
                                        )),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
