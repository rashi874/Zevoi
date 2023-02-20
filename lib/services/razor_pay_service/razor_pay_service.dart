import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:zevoyi/utils/app_exceptions.dart';

class RazorPayService {
  void openRazorPay(Razorpay razorPay, options) {
    try {
      razorPay.open(options);
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
  }
}
