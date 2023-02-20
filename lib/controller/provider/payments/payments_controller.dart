import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:zevoyi/controller/provider/orders/place_order_model.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';
import 'package:zevoyi/routes/rout_names.dart';
import 'package:zevoyi/services/orders/order_service.dart';
import 'package:zevoyi/services/razor_pay_service/razor_pay_service.dart';
import 'package:zevoyi/view/orders/model/order_placed_screen_arguement_model.dart';
import 'package:zevoyi/view/profile/widget/navigator_key_class.dart';

class PaymentProvider with ChangeNotifier {
  final String onlinePayment = 'Online Payment';
  final String cashOnDelivery = 'Cash On Delivery';
  String paymentType = 'Online Payment';
  bool isVisible = false;
  Razorpay razorPay = Razorpay();
  bool success = false;
  BuildContext? ctx;
  Map<String, dynamic> options = {};
  bool loading = false;
  List<Product> products = [];
  String? addressId;

  void setTotalAmount(amount, List<String> productIds, address) {
    final total = "${(num.parse(amount) * 100)}";
    final amountPayable = total.toString();
    setOptions(amountPayable);
    products = productIds.map((e) => Product(id: e)).toList();
    addressId = address;
    notifyListeners();
  }

  void setOptions(String amountPayable) {
    options = {
      'key': 'rzp_test_RVe81OqJboapJ6',
      'amount': amountPayable,
      'name': 'ShoeCart',
      'description': 'Shoes',
      'prefill': {
        'contact': '7856123494',
        'email': 'shoeCart@gmail.com',
      },
    };
    notifyListeners();
  }

  paymentSelection(String? value) {
    if (value == onlinePayment) {
      isVisible = true;
      notifyListeners();
    } else if (value == cashOnDelivery) {
      isVisible = false;
      notifyListeners();
    }
    paymentType = value.toString();
    notifyListeners();
  }

  void order(context) async {
    if (paymentType == cashOnDelivery) {
      await orderProducts(addressId!, 'COD');
    } else if (paymentType == onlinePayment) {
      RazorPayService().openRazorPay(razorPay, options);
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    orderProducts(addressId!, 'ONLINE_PAYMENT');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'Payment Canceled', backgroundColor: AppColors.redColor);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: 'External Wallet');
  }

  Future<void> orderProducts(String addressId, paymentType) async {
    loading = true;
    notifyListeners();
    final PlaceOrderModel model = PlaceOrderModel(
      addressId: addressId,
      paymentType: paymentType,
      products: products,
    );
    await OrderServices().placeOrder(model).then((value) {
      if (value != null) {
        loading = false;
        notifyListeners();
        final OrderPlacedScreenArguementModel args =
            OrderPlacedScreenArguementModel(orderId: value);
        Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushReplacementNamed(RouteNames.orderPlacedScreen, arguments: args)
            .then((value) {
          Navigator.of(NavigationService.navigatorKey.currentContext!)
              .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
        });
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
