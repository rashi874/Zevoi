import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zevoyi/model/login_model/login_model.dart';
import 'package:zevoyi/routes/rout_names.dart';
import 'package:zevoyi/services/login_api_service/login_service.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isNotVisible = true;
  bool loading = false;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else {
      return null;
    }
  }

  String? numberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length != 10) {
      return 'Invalid mobile number';
    } else {
      return null;
    }
  }

  void passwordHide() {
    isNotVisible = !isNotVisible;
    notifyListeners();
  }

  void toSignUpScreen(context) {
    clearControllers();
    Navigator.of(context).pushNamed(RouteNames.signUpScreen);
  }

  void toForgotPasswordScreen(context) {
    clearControllers();
    Navigator.of(context).pushNamed(RouteNames.findMyAccount);
  }

  void login(context, FormState currentState) async {
    if (currentState.validate()) {
      loading = true;
      notifyListeners();
      final LoginModel model = LoginModel(
        email: emailController.text,
        password: passwordController.text,
      );
      await SignInService().login(model).then((value) async {
        if (value != null) {
          await storage.write(key: 'token', value: value.accessToken);
          await storage.write(key: 'refreshToken', value: value.refreshToken);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
          clearControllers();
          loading = false;
          notifyListeners();
        } else {
          loading = false;
          notifyListeners();
        }
      });
    }
  }

  // void googleSignin(context) async {
  //   loading = true;
  //   notifyListeners();
  //   await SignInService().googleSignIn(googleSignIn).then(
  //     (value) {
  //       if (value != null) {
  //         Navigator.of(context)
  //             .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
  //         clearControllers();
  //         loading = false;
  //         notifyListeners();
  //       } else {
  //         loading = false;
  //         notifyListeners();
  //       }
  //     },
  //   );
  // }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
