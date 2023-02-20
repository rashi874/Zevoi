import 'package:flutter/cupertino.dart';
import 'package:zevoyi/model/address/get_address_model.dart';
import 'package:zevoyi/model/cart/get_single_cart_model.dart';
import 'package:zevoyi/model/order_summary/order_summary_screen_enum.dart';
import 'package:zevoyi/routes/rout_names.dart';
import 'package:zevoyi/services/address/address_service.dart';
import 'package:zevoyi/services/cart/cart_service.dart';
import 'package:zevoyi/view/payments/model/payment_screen_arguement_model.dart';

class OrderSummaryProvider with ChangeNotifier {
  OrderSummaryProvider() {
    startLoading();
  }
  AddressModel? address;
  bool loading = false;
  List<GetSingelCartProduct> products = [];
  int? totalSave;
  List<String> productIds = [];

  void toPaymentScreen(context, String itemCount, String totalAmount,
      List<String> productIds, String addressId) {
    final args = PaymentScreenArguementModel(
        itemCount: itemCount,
        totalAmount: totalAmount,
        productIds: productIds,
        addressId: addressId);
    Navigator.of(context).pushNamed(RouteNames.paymentScreen, arguments: args);
  }

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void getSingleAddress(String addressId) async {
    await AddressService().getSingleAddress(addressId).then((value) {
      if (value != null) {
        address = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  Future<void> checkScreen(OrderSummaryScreenEnum screenCheck,
      String? productId, String? cartId) async {
    if (screenCheck == OrderSummaryScreenEnum.normalOrderSummaryScreen) {
      return;
    } else if (screenCheck ==
        OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen) {
      await getSingleCartProduct(productId!, cartId!).then((value) {
        loading = false;
        notifyListeners();
        return;
      });
    }
  }

  Future<void> getSingleCartProduct(String productId, String cartId) async {
    await CartService().getSingleCartProduct(productId, cartId).then((value) {
      if (value != null) {
        products = value;
        notifyListeners();
        totalSave =
            products[0].discountPrice.toInt() - products[0].price.toInt();
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
