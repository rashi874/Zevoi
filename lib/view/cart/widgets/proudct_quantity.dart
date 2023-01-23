import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({
    super.key,
    required this.ontap1,
    required this.ontap2,
    required this.quantity,
  });
  final void Function() ontap1;
  final void Function() ontap2;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ontap1,
              child: const Icon(
                Icons.remove,
                color: AppColors.blackcolor,
              ),
            ),
            AppSizedBoxes.sizedboxW3,
            FittedBox(
              child: Text(
                quantity.toString(),
                style: const TextStyle(
                  color: AppColors.blackcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            AppSizedBoxes.sizedboxW3,
            GestureDetector(
              onTap: ontap2,
              child: const Icon(
                Icons.add,
                color: AppColors.blackcolor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
