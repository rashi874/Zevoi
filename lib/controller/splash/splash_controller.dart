import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../routes/rout_names.dart';

class SplashProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? onboardValue;
  String? signInValue;

  void splash(context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    onboardValue = await storage.read(key: 'onboard');
    signInValue = await storage.read(key: 'token');
    log(signInValue.toString());
    if (signInValue != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.bottomNav, (route) => false);
    } else {
      if (onboardValue != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.signInScreen, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.signInScreen, (route) => false);
      }
    }
  }
}
