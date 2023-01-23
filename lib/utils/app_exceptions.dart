import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zevoyi/utils/app_toast.dart';

class AppExceptions {
  static void errorHandler(Object e) {
    if (e is PlatformException) {
      AppToast.showToast('Platform Error Occured', Colors.red);
    }
    if (e is SocketException) {
      AppToast.showToast('No Internet Connection', Colors.red);
    } else if (e is TimeoutException) {
      AppToast.showToast('Connection Timedout', Colors.red);
    } else if (e is MissingPluginException) {
      AppToast.showToast('Plugin error occured', Colors.red);
    } else if (e is DioError) {
      if (e.response?.data['message'] != null) {
        AppToast.showToast(e.response!.data['message'].toString(), Colors.red);
      } else if (e.type == DioErrorType.connectTimeout) {
        AppToast.showToast('Connection timedout', Colors.red);
      } else if (e.type == DioErrorType.receiveTimeout) {
        AppToast.showToast('Response timedout', Colors.red);
      } else if (e.type == DioErrorType.cancel) {
        AppToast.showToast('Request cancelled', Colors.red);
      } else if (e.type == DioErrorType.sendTimeout) {
        AppToast.showToast('Request timedout', Colors.red);
      } else if (e.error is SocketException) {
        AppToast.showToast('No Internet Connection', Colors.red);
      } else if (e.type == DioErrorType.other) {
        AppToast.showToast('Something went wrong', Colors.red);
      }
    }
  }
}
