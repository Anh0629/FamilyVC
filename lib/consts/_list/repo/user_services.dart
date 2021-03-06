import 'dart:io';

import 'package:flutter_app/consts/_list/Model/user_model.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserServices {
  static Future<Object> userLogin(var body) async {
    try {
      var response = await http.post(
        Uri.parse(USER_LOGIN_URL),
        // ket noi express
        headers: {
          'Content-Type': 'application/json',
        },
        // encode: Object => Json Object
        body: json.encode(body),
      );
      print('user services');
      print(response.body);

      if (response.statusCode == 200) {
        return Success(code: 200, response: userModelFromJson(response.body));
      }
      return Failure(
          code: PRODUCT_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
