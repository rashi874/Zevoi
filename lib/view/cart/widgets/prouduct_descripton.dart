import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class CartPruductTextStyle extends StatelessWidget {
  const CartPruductTextStyle({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    this.fontsize = 14,
  });
  final String text1;
  final int text2;
  final String text3;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '₹$text1',
          style: TextStyle(
            color: AppColors.whiteColor54,
            decoration: TextDecoration.lineThrough,
            overflow: TextOverflow.ellipsis,
            fontSize: fontsize,
          ),
        ),
        AppSizedBoxes.sizedboxW5,
        Text(
          '₹$text2',
          style: TextStyle(
            color: AppColors.whiteColor,
            overflow: TextOverflow.ellipsis,
            fontSize: fontsize,
          ),
        ),
        AppSizedBoxes.sizedboxW5,
        Text(
          "$text3%",
          style: TextStyle(
            color: AppColors.greenColor,
            overflow: TextOverflow.ellipsis,
            fontSize: fontsize,
          ),
        ),
      ],
    );
  }
}
