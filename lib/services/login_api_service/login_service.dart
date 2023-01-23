import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';
import 'package:zevoyi/core/constant/api_queryparameters.dart';
import 'package:zevoyi/model/token_model/token_model.dart';
import 'package:zevoyi/utils/app_exceptions.dart';
import '../../core/api/api_endpoint.dart';
import '../../model/login_model/login_model.dart';

class SignInService {
  final dio = Dio();
  Future<TokenModel?> login(LoginModel model) async {
    try {
      Response response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.login,
        queryParameters: ApiQueryParameter.queryParameter,
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        final TokenModel model = TokenModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  // Future<String?> googleSignIn(GoogleSignIn googleSignIn) async {
  //   try {
  //     final result = await googleSignIn.signIn();
  //     Response response =
  //         await dio.post(ApiUrl.apiUrl + ApiEndPoints.googleSignIn, data: {
  //       'email': result?.email,
  //       'name': result?.displayName,
  //     });
  //     log(response.statusCode.toString());
  //     if (response.statusCode == 201) {
  //       return response.data['message'];
  //     }
  //   } catch (e) {
  //     log('entered catch of googlesignin');
  //     AppExceptions.errorHandler(e);
  //   }
  //   return null;
  // }
}

 
