import 'package:flutter/material.dart';
import 'package:zevoyi/services/forgot_password/forgot_password_service.dart';

import '../../../model/otp_model/otp_screen_arguement_model.dart';
import '../../../model/otpscreen_enum_model.dart/otpscreen_enum.dart';
import '../../../routes/rout_names.dart';
import '../../../services/otp_service/otp_service.dart';
import '../../../utils/app_toast.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool loading = false;
  final TextEditingController findAccountController = TextEditingController();

  void toOtpScreen(context, FormState currentState) {
    if (currentState.validate()) {
      loading = true;
      notifyListeners();
      ForgotPasswordService().getUser(findAccountController.text).then((model) {
        if (model != null) {
          OtpService().sendOtp(model.email).then((value) {
            if (value != null) {
              final args = OtpArguementModel(
                  model: model, checkScreen: OtpScreenEnum.forgotOtpScreen);
              Navigator.of(context).pushNamed(
                RouteNames.otpScreen,
                arguments: args,
              );
              loading = false;
              notifyListeners();
            } else {
              loading = false;
              notifyListeners();
            }
          });
        } else {
          loading = false;
          notifyListeners();
          AppToast.showToast('No user Found', Colors.red);
        }
      });
    }
  }

  String? findAccountTextfieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }
}
