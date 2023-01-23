import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';
import 'package:zevoyi/core/api/api_endpoint.dart';
import 'package:zevoyi/utils/app_exceptions.dart';

import '../../core/constant/api_queryparameters.dart';
class OtpService {
  final dio = Dio();
  Future<String?> verifyOtp(email, otpNumber) async {
    try {
      Response response =
          await dio.post(ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
              data: {
                'otp': otpNumber,
                'email': email,
              },
              queryParameters: ApiQueryParameter.queryParameter);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['status'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> sendOtp(email) async {
    log(email);
    try {
      log('entered to send otp');
      Response response = await dio.get(
        ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
        queryParameters: {
          'email': email,
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('otp send ');
        log(response.data.toString());
        return response.data['message'];
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
