import 'package:dio/dio.dart';
import 'package:zevoyi/utils/app_exceptions.dart';

import '../../core/api/api_baseurl.dart';
import '../../core/api/api_endpoint.dart';
import '../../model/wish_list_model/wish_list_model.dart';
import '../../utils/dio_interceptor.dart';

class WishListService {
  Future<WishListModel?> getWishListItems() async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.wishList);
      if (response.statusCode == 200) {
        final WishListModel model = WishListModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<int?> addOrRemoveFromWishList(String productId) async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
        ApiUrl.apiUrl + ApiEndPoints.wishList,
        data: {'product': productId},
      );

      if (response.statusCode == 201) {
        return response.statusCode;
      } else if (response.statusCode == 204) {
        return response.statusCode;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }

    return null;
  }
}
