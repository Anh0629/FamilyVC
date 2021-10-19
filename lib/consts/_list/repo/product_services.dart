import 'dart:io';

import 'package:flutter_app/consts/_list/Model/product_list_model.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/utils/constants.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<Object> fetchProduct() async {
    try {
      var url = Uri.parse(PRODUCT_URL);
      var response = await http.get(url);
      print(response.body);

      if (response.statusCode == 200) {
        return Success(
            code: 200, response: productModelFromJson(response.body));
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
