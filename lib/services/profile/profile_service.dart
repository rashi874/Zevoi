import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/api/api_baseurl.dart';
import '../../core/api/api_endpoint.dart';
import '../../utils/app_exceptions.dart';
import '../../utils/dio_interceptor.dart';

class ProfileService {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  // Future<List<Data>?> getProfiledata() async {
  //   Dio dios = await Interceptorapi().getApiUser();
  //   try {
  //     final Response response =
  //         await dios.get(ApiUrl.apiUrl + ApiEndPoints.categories);
  //     if (response.statusCode! >= 200 && response.statusCode! <= 299) {
  //       final List<Data> categories =
  //           (response.data as List).map((e) => Data.fromJson(e)).toList();
  //       return categories;
  //     }
  //   } catch (e) {
  //     AppExceptions.errorHandler(e);
  //   }
  //   return null;
  // }

  Future<String?> logOutUser() async {
    final dios = await Interceptorapi().getApiUser();
    try {
      log('logout function calling');
      final token = storage.read(key: 'token');
      final refreshToken = storage.read(key: 'refreshToken');
      dios.options.headers["authorization"] = "Bearer $token";
      dios.options.headers["refresh"] = "$refreshToken";
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.logout);
      log('logout function called');

      if (response.statusCode == 200) {
        log('log out successful');
        return response.data['message'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
