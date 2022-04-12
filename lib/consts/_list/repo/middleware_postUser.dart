import 'dart:developer';
import 'dart:io';
import 'package:flutter_app/consts/_list/Model/middleware.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserPostMidd {
  static Future<Object> userpostmidd(String token) async {
    try {
      var response = await http.post(
        Uri.parse(USER_SIGN_UP_URL),
        headers: {
          'Content-Type': 'application/json',
          'authorization': 'Bearer ' + token,
        },
      );

      print(USER_SIGN_UP_URL);
      print(response.body);
      print('User');
      log(token);
      if (response.statusCode == 200) {
        return Success(
            code: 200, response: postUserMiddFromJson(response.body));
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
