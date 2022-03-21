import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/consts/_list/Model/user_update_Password.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserPatchPass {
  static Future<Object> patchdata(var body, String userId) async {
    try {
      var response = await http.patch(
        Uri.parse(UPDATAPASS_URL + '$userId'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body)
      );

      print('---------------------------------');
      print(json.encode(body));
      print(Uri.parse(UPDATAPASS_URL + '$userId'));
      print(response.body);


      if(response.statusCode == 200){
        return Success(
          code: 200, response: UserUpdatePasswordFromJson(response.body)
        );

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
