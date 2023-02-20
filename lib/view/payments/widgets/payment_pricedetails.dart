import 'package:flutter/material.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';

import '../../../helper/sizedboxes/app_sizedboxes.dart';
import '../../cart/widgets/details_price.dart';

class PaymentPriceDetails extends StatelessWidget {
  const PaymentPriceDetails({
    super.key,
    required this.itemCount,
    required this.amountPayable,
    required this.deliveryCharge,
  });
  final String itemCount;
  final String amountPayable;
  final String deliveryCharge;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Details',
          style: TextStyle(color: AppColors.dullWhitecolor),
        ),
        AppSizedBoxes.sizedboxH15,
        DetailsPrice(text1: 'Price ($itemCount item)', text2: amountPayable),
        AppSizedBoxes.sizedboxH8,
        DetailsPrice(
          text1: 'Delivery Charges',
          text2: deliveryCharge,
          color2: AppColors.greenColor,
          rupeeSymbol: deliveryCharge == 'Free' ? true : false,
        ),
        AppSizedBoxes.sizedboxH8,
        const Divider(thickness: 1),
        DetailsPrice(
          text1: 'Amount Payable',
          text2: amountPayable,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
