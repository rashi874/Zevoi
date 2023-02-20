
import 'package:zevoyi/model/order_summary/order_summary_screen_enum.dart';

class OrderSummaryArguementModel {
  final String addressId;
  final OrderSummaryScreenEnum screenCheck;
  final String? productId;
  final String? cartId;
  OrderSummaryArguementModel({
    required this.addressId,
    required this.screenCheck,
    this.productId,
    this.cartId,
  });
}
