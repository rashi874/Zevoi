import 'package:flutter/material.dart';
import 'package:zevoyi/model/login_model/login_model.dart';
import 'package:zevoyi/services/login_api_service/login_service.dart';

import '../../view/home/home_screen.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginServices loginServices = LoginServices();
  bool isLoading = false;

  //
  void logIn(BuildContext context) {
    isLoading = true;
    notifyListeners();
    final LoginModel loginModel = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );
    loginServices.loginUser(loginModel, context).then(
      (value) {
        if (value != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),
          );
          disposeTextfield();
        } else {
          return;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void disposeTextfield() {
    emailController.clear();
    passwordController.clear();
  }
}
