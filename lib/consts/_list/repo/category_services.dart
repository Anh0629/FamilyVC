import 'dart:io';

import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/utils/constants.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<Object> fetchCategory() async {
    try {
      var url = Uri.parse(CATEGORY_URL);
      // var urlTest = Uri.parse('https://reactnative.dev/movies.json');
      print('GET ' + CATEGORY_URL);
      var response = await http.get(url).timeout(Duration(seconds: 10));

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return Success(
            code: 200, response: categoryModelFromJson(response.body));
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
