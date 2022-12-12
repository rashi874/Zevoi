import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:zevoyi/model/sign_up_model/sign_up_model.dart';

import '../../core/api/api_baseurl.dart';
import '../../core/api/api_endpoint.dart';

class SignupServices {
  Dio dio = Dio();

  Future<SignupModel?> signupUser(
      SignupModel model, BuildContext context) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.signUp,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final signupResponse = SignupModel.fromJson(response.data);
        log(response.data.toString());
        return signupResponse;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
