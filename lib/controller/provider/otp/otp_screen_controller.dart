import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zevoyi/model/new_password/model/newpassword_screen_model.dart';
import '../../../model/otpscreen_enum_model.dart/otpscreen_enum.dart';
import '../../../model/sign_up_model/sign_up_model.dart';
import '../../../routes/rout_names.dart';
import '../../../services/otp_service/otp_service.dart';
import '../../../services/signup_api_service/signup_services.dart';
import '../../../utils/app_toast.dart';

class OtpScreenProvider with ChangeNotifier {
  int timeRemaining = 60;
  Timer? timer;
  bool enableResend = false;
  bool clear = false;
  bool otpDone = false;
  String code = '';
  bool loading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void setResendVisibility(bool newValue, context, String email) {
    clear = true;
    notifyListeners();
    OtpService().sendOtp(email).then((value) {
      if (value != null) {
        clear = false;
        notifyListeners();
        enableResend = newValue;
        timeRemaining = 60;
      } else {
        return null;
      }
    });
  }

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void verifyCode(context, SignUpModel model, OtpScreenEnum screenChek) async {
    if (code.length != 4) {
      AppToast.showToast('Please enter OTP', Colors.red);
    } else {
      if (timeRemaining == 0) {
        AppToast.showToast('Otp timedout', Colors.red);
      } else {
        loading = true;
        notifyListeners();
        if (screenChek == OtpScreenEnum.forgotOtpScreen) {
          await OtpService().verifyOtp(model.email, code).then((value) {
            if (value != null) {
              final args = NewPasswordScreenArguementsModel(model: model);
              Navigator.of(context)
                  .pushReplacementNamed(RouteNames.newPasswordScreen,
                      arguments: args)
                  .then((value) {
                loading = false;
                notifyListeners();
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        } else if (screenChek == OtpScreenEnum.signUpOtpScreen) {
          await OtpService().verifyOtp(model.email, code).then((value) async {
            if (value != null) {
              await SignUpService().signUp(model, context).then((value) async {
                if (value != null) {
                  await storage.write(key: 'token', value: value.accessToken);
                  await storage.write(
                      key: 'refreshToken', value: value.refreshToken);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteNames.bottomNav, (route) => false);
                  loading = false;
                  notifyListeners();
                } else {
                  loading = false;
                  notifyListeners();
                }
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        }
      }
    }
  }

  void changeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeRemaining != 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }
}
