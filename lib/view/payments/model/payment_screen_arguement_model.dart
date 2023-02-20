class PaymentScreenArguementModel {
  final String itemCount;
  final String totalAmount;
  final List<String> productIds;
  final String addressId;

  PaymentScreenArguementModel({
    required this.itemCount,
    required this.totalAmount,
    required this.productIds,
    required this.addressId,
  });
}
