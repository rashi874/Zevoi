import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:zevoyi/model/sign_up_model/sign_up_model.dart';
import 'package:zevoyi/model/sign_up_model/signup_token_model.dart';

import '../../core/api/api_baseurl.dart';
import '../../core/api/api_endpoint.dart';
import '../../utils/app_exceptions.dart';

class SignUpService {
  final dio = Dio();
  Future<SignUpTokenModel?> signUp(SignUpModel model, context) async {
    try {
      Response response = await dio.post(ApiUrl.apiUrl + ApiEndPoints.signUp,
          data: jsonEncode(model.toJson()),
          queryParameters: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final SignUpTokenModel model = SignUpTokenModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
