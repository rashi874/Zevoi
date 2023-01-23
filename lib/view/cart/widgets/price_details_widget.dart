import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';
import 'details_price.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({
    super.key,
    required this.itemCount,
    required this.amount,
    required this.discount,
    required this.deliveryCharge,
    required this.totalAmount,
  });
  final String itemCount;
  final String discount;
  final String deliveryCharge;
  final String totalAmount;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        AppSizedBoxes.sizedboxH20,
        DetailsPrice(
          text1: 'Price($itemCount)',
          text2: amount,
        ),
        AppSizedBoxes.sizedboxH8,
        DetailsPrice(
          text1: 'Discount',
          text2: '- ₹$discount',
          color2: AppColors.greenColor,
          rupeeSymbol: true,
        ),
        AppSizedBoxes.sizedboxH8,
        DetailsPrice(
          text1: 'Delivery Charges',
          text2: deliveryCharge,
          color2: AppColors.greenColor,
          rupeeSymbol: true,
        ),
        AppSizedBoxes.sizedboxH8,
        const Divider(thickness: 1),
        AppSizedBoxes.sizedboxH8,
        DetailsPrice(
          text1: 'Total Amount',
          text2: totalAmount,
          fontWeight: FontWeight.bold,
        ),
        AppSizedBoxes.sizedboxH8,
        const Divider(thickness: 1),
        AppSizedBoxes.sizedboxH15,
        Text(
          'You will save ₹$discount on this order',
          style: const TextStyle(
            color: AppColors.greenColor,
          ),
        ),
        AppSizedBoxes.sizedboxH80,
      ],
    );
  }
}
