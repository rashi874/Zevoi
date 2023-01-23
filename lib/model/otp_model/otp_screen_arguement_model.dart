import 'package:zevoyi/model/sign_up_model/sign_up_model.dart';

import '../otpscreen_enum_model.dart/otpscreen_enum.dart';

class OtpArguementModel {
  final SignUpModel model;
  final OtpScreenEnum checkScreen;
  OtpArguementModel({
    required this.model,
    required this.checkScreen,
  });
}
