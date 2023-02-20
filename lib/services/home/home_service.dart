import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';
import 'package:zevoyi/model/home_models/product_model.dart';

import '../../core/api/api_endpoint.dart';
import '../../model/home_models/carousal_model.dart';
import '../../model/home_models/category_model.dart';
import '../../utils/app_exceptions.dart';
import '../../utils/dio_interceptor.dart';

class HomeService {
  Future<List<CarousalModel>?> getCarousals() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
        ApiUrl.apiUrl + ApiEndPoints.carousal,
      );
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<CarousalModel> carousals = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();
        return carousals;
      } else {
        return null;
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<CategoryModel>?> getCategories() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.categories);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<CategoryModel> categories = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return categories;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<Product>?> getAllProducts() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.product);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<Product> products =
            (response.data as List).map((e) => Product.fromJson(e)).toList();

        return products;
      }
    } on DioError catch (e) {
      log(e.message);
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<Product>?> getProductsByCategory(String categoryId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios
          .get('${ApiUrl.apiUrl + ApiEndPoints.product}?category=$categoryId');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<Product> products =
            (response.data as List).map((e) => Product.fromJson(e)).toList();
        return products;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<Product>?> searchProducts(String searchValue) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
          ApiUrl.apiUrl + ApiEndPoints.product,
          queryParameters: {"search": searchValue});
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<Product> products =
            (response.data as List).map((e) => Product.fromJson(e)).toList();

        return products;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<Product?> getAProduct(String productId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get('${ApiUrl.apiUrl + ApiEndPoints.product}/$productId');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final Product product = Product.fromJson(response.data);
        return product;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
