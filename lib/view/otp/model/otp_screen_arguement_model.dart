import 'package:zevoyi/model/otpscreen_enum_model.dart/otpscreen_enum.dart';

import '../../../model/sign_up_model/sign_up_model.dart';

class OtpArguementModel {
  final SignUpModel model;
  final OtpScreenEnum checkScreen;
  OtpArguementModel({
    required this.model,
    required this.checkScreen,
  });
}
