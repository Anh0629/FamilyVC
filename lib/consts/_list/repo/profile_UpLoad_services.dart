import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/consts/_list/Model/profiles_model.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/utils/constants.dart';
import 'package:http/http.dart' as http;

class ProfileUpLoadService {
  static Future<Object> postProfile(var body) async {
    try {
      var response = await http.post(
        Uri.parse(UPLOAD_URL),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );
      print("response: ${response.body}");

      if (response.statusCode == 200) {
        return Success(
            code: 200, response: profileModelFromJson(response.body));
      }
      return Failure(
          code: PRODUCT_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      print(e.toString());
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
