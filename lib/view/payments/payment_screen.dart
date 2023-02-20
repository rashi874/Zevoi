import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:zevoyi/controller/provider/bottom_nav/bottom_nav_bar_controller.dart';
import 'package:zevoyi/controller/provider/payments/payments_controller.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';
import 'package:zevoyi/view/cart/widgets/custom_bottom_placeorderwidget.dart';
import 'package:zevoyi/view/payments/widgets/payment_options.dart';
import 'package:zevoyi/view/payments/widgets/payment_pricedetails.dart';

import '../../helper/sizedboxes/app_sizedboxes.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.totalAmount,
    required this.itemCount,
    required this.productIds,
    required this.addressId,
  });

  final String totalAmount;
  final String itemCount;
  final List<String> productIds;
  final String addressId;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late PaymentProvider paymentProvider;
  late BottomNavBarProvider bottomProvider;
  @override
  void initState() {
    paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    bottomProvider = Provider.of<BottomNavBarProvider>(context, listen: false);
    bottomProvider.currentIndex = 2;
    final razorpay = paymentProvider.razorPay;
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, paymentProvider.handlePaymentSuccess);
    razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR, paymentProvider.handlePaymentError);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET, paymentProvider.handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      paymentProvider.setTotalAmount(
        widget.totalAmount,
        widget.productIds,
        widget.addressId,
      );
      paymentProvider.paymentSelection(paymentProvider.onlinePayment);
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('Payments'),
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Divider(thickness: 1),
              AppSizedBoxes.sizedboxH15,
              const Text(
                'Payment options',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              AppSizedBoxes.sizedboxH12,
              Consumer<PaymentProvider>(
                builder: (context, values, _) {
                  return PaymentOptions(paymentProvider: values);
                },
              ),
              AppSizedBoxes.sizedboxH12,
              const Divider(thickness: 4),
              PaymentPriceDetails(
                itemCount: widget.itemCount.toString(),
                amountPayable: widget.totalAmount,
                deliveryCharge: 'Free',
              ),
              const Spacer(),
              Consumer<PaymentProvider>(
                builder: (context, values, _) {
                  return values.isVisible == true
                      ? Container(
                          height: 15,
                          width: double.infinity,
                          color: AppColors.whiteColor,
                          child: const Center(
                            child: Text(
                              '100% Safe and Secure Payments',
                              style: TextStyle(color: AppColors.blackcolor),
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              ),
              CustomBottomPlaceOrderWidget(
                ontap: () => paymentProvider.order(context),
                totalAmount: widget.totalAmount,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    paymentProvider.razorPay.clear();
    super.dispose();
  }
}
