import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class PlacedContainer extends StatelessWidget {
  const PlacedContainer({
    super.key,
    required this.itemCount,
    required this.totalAmount,
    required this.onTap,
  });
  final String itemCount;
  final String totalAmount;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      color: AppColors.blueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSizedBoxes.sizedboxH15,
          const Text(
            'Order Placed',
            style: TextStyle(fontSize: 20),
          ),
          AppSizedBoxes.sizedboxH8,
          Text('Total price for $itemCount items ₹$totalAmount'),
          AppSizedBoxes.sizedboxH8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('View Details'),
              AppSizedBoxes.sizedboxW3,
              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
