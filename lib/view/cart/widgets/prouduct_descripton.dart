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
  final dynamic text1;
  final int text2;
  final String text3;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("₹${text1.toStringAsFixed(0)}",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  overflow: TextOverflow.ellipsis,
                )),
        AppSizedBoxes.sizedboxW10,
        Text('₹$text2',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                )),
        AppSizedBoxes.sizedboxW10,
        Text("$text3%",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                  overflow: TextOverflow.ellipsis,
                )),
      ],
    );
  }
}
