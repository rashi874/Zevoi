import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:zevoyi/model/otp_model/otp_screen_arguement_model.dart';
import 'package:zevoyi/model/sign_up_model/sign_up_model.dart';
import 'package:zevoyi/routes/rout_names.dart';
import 'package:zevoyi/services/forgot_password/forgot_password_service.dart';

import '../../model/otpscreen_enum_model.dart/otpscreen_enum.dart';
import '../../services/otp_service/otp_service.dart';
import '../../utils/app_toast.dart';

class SignUpProvider with ChangeNotifier {
  SignUpProvider() {
    clearControllers();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isNotVisible = true;
  bool loading = false;

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    mobileNumberController.clear();
    isNotVisible = true;
  }

  String? numberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length != 10) {
      return 'Number must be 10 digits';
    } else {
      return null;
    }
  }

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
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Short password';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    } else if (value != passwordController.text) {
      return 'Password do not match';
    } else {
      return null;
    }
  }

  void passwordHide() {
    isNotVisible = !isNotVisible;
    notifyListeners();
  }

  void toSignUpOtpScreen(context, FormState currentState) async {
    final SignUpModel model = SignUpModel(
      fullName: nameController.text,
      email: emailController.text,
      number: mobileNumberController.text,
      password: passwordController.text,
    );
    final args = OtpArguementModel(
        model: model, checkScreen: OtpScreenEnum.signUpOtpScreen);
    if (currentState.validate()) {
      loading = true;
      notifyListeners();
      await ForgotPasswordService()
          .getUser(emailController.text)
          .then((value) async {
        if (value == null) {
          await OtpService().sendOtp(emailController.text).then((value) {
            log(value.toString());
            if (value != null) {
              Navigator.of(context)
                  .pushNamed(RouteNames.otpScreen, arguments: args)
                  .then((value) {
                loading = false;
                notifyListeners();
              });
            } else {
              return null;
            }
          });
        } else {
          AppToast.showToast('User already exists', Colors.red);
        }
      });
      loading = false;
      notifyListeners();
    }
  }
}
