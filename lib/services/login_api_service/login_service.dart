import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';
import '../../core/api/api_endpoint.dart';
import '../../model/login_model/login_model.dart';

class LoginServices {
  Dio dio = Dio();
  LoginModel? loginModel;
  Future<LoginModel?> loginUser(LoginModel model, BuildContext context) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.signIn,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        loginModel = LoginModel.fromJson(response.data);
        log(response.data.toString());
        const snackBar = SnackBar(
          backgroundColor: Colors.cyan,
          content: Text("Login Successfull,"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        return loginModel;
      } else {
        const snackBar = SnackBar(
            backgroundColor: Colors.cyan, content: Text("Login Failed"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on DioError catch (e) {
      const snackBar = SnackBar(
          backgroundColor: Colors.cyan,
          content: Text(
            "email or password incorrect",
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      log(e.message);
    }
    return null;
  }
}
 
 
 
 
  // Future<void> signIn(String name, String password) async {
  //   String apiUrl = '$baseUrl/sign-in';
  //   try {
  //     final Response response =
  //         await dio.post(apiUrl, data: {'name': name, 'password': password});
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // final data = jsonDecode(response.data.toString());
  //       log(response.data.toString());
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //   }
  // }