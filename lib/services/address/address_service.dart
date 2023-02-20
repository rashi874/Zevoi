import 'package:dio/dio.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';
import 'package:zevoyi/model/address/add_address_model.dart';
import 'package:zevoyi/model/address/get_address_model.dart';
import 'package:zevoyi/utils/dio_interceptor.dart';

import '../../core/api/api_endpoint.dart';
import '../../utils/app_exceptions.dart';

class AddressService {
  Future<String?> addAddress(AddNewAddressModel model) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
        ApiUrl.apiUrl + ApiEndPoints.address,
        data: model.toJson(),
      );

      if (response.statusCode == 201) {
        final String result = response.data['message'];
        return result;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<AddressModel>?> getAllAddress() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.address);

      if (response.statusCode == 200) {
        final List<AddressModel> addressList = (response.data as List)
            .map((e) => AddressModel.fromJson(e))
            .toList();
        return addressList;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<AddressModel?> getSingleAddress(String addressId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get("${ApiUrl.apiUrl + ApiEndPoints.address}/$addressId");

      if (response.statusCode == 200) {
        final AddressModel model = AddressModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> updateAddress(
      AddNewAddressModel model, String addressId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.patch(
        "${ApiUrl.apiUrl + ApiEndPoints.address}/$addressId",
        data: model.toJson(),
      );

      if (response.statusCode == 202) {
        final String result = response.data['message'];
        return result;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> deleteAddress(String addressId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios
          .delete("${ApiUrl.apiUrl + ApiEndPoints.address}/$addressId");

      if (response.statusCode == 202) {
        final String result = response.data['message'];
        return result;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
