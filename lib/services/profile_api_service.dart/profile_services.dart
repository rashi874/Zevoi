import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:zevoyi/model/profile_model/profile_model.dart';
import '../../core/api/api_baseurl.dart';
import '../../core/api/api_endpoint.dart';

class ProflieServices {
  Dio dio = Dio();
  Data? profileModel;
  Future<Data?> fetch(id) async {
    try {
      Response response = await dio.get(
        ApiBaseUrl().baseUrl + ApiEndpoints.profile + id,
        // data: jsonEncode(
        //   model.toJson(),
        // ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        profileModel = Data.fromJson(response.data);
        // log(response.data.toString());
        log(profileModel!.username.toString());

        return profileModel;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
