import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';

class Api {
  Dio api = Dio();

  String? accessToken;
  final storage = const FlutterSecureStorage();
  Api() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (options.path.contains('http')) {
        options.path = ApiBaseUrl().baseUrl + options.path;
      }
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if ((error.response?.statusCode == 401 &&
          error.response?.data['message'] == "invalid JWT")) {
        if (await storage.containsKey(key: 'refreshToken')) {
          await refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
        }
      }
      return handler.next(error);
    }));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }

  Future<void> refreshToken() async {
    final refereshToken = await storage.read(key: 'refreshToken');
    final response =
        await api.post('auth/refresh', data: {refereshToken: refreshToken});
    if (response.statusCode == 201) {
      accessToken = response.data;
    } else {
      accessToken = null;
      storage.deleteAll();
    }
  }
}
