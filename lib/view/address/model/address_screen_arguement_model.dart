
import '../../../model/order_summary/order_summary_screen_enum.dart';

class AddressScreenArguementModel {
  final OrderSummaryScreenEnum screenCheck;
  final String? cartId;
  final String? productId;
  final bool visibility;
  AddressScreenArguementModel({
    required this.screenCheck,
    this.cartId,
    this.productId,
    this.visibility = false,
  });
}
