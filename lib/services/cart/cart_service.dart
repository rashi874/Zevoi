import 'dart:convert';
import 'package:dio/dio.dart';

import '../../core/api/api_baseurl.dart';
import '../../core/api/api_endpoint.dart';
import '../../model/cart/add_to_cart_model.dart';
import '../../model/cart/get_from_cart_model.dart';
import '../../model/cart/get_single_cart_model.dart';
import '../../utils/app_exceptions.dart';
import '../../utils/dio_interceptor.dart';

class CartService {
  Future<CartGetModel?> getCartItems() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.cart);

      if (response.statusCode == 200) {
        final CartGetModel model = CartGetModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> addToCart(AddToCartModel model) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
          ApiUrl.apiUrl + ApiEndPoints.cart,
          data: jsonEncode(model.toJson()));
      if (response.statusCode == 201) {
        final String resp = response.data['message'];
        return resp;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> removeFromCart(String productId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.patch(
        ApiUrl.apiUrl + ApiEndPoints.cart,
        data: {'product': productId},
      );
      if (response.statusCode == 201) {
        final String resp = response.data['message'];
        return resp;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<GetSingelCartProduct>?> getSingleCartProduct(
      String productId, String cartId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
          '${ApiUrl.apiUrl + ApiEndPoints.cart}/$cartId/product/$productId');
      if (response.statusCode == 200) {
        final List<GetSingelCartProduct> product = (response.data as List)
            .map((e) => GetSingelCartProduct.fromJson(e))
            .toList();
        return product;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
