import 'package:flutter/material.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:zevoyi/view/product_screen/widgets/utils/product_description_style2.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.productName,
    required this.rating,
    required this.linethroughPrice,
    required this.currentPrice,
    required this.offer,
    required this.fee,
  });
  final String productName;
  final String rating;
  final String linethroughPrice;
  final String currentPrice;
  final String offer;
  final String fee;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        AppSizedBoxes.sizedboxH8,
        Container(
          width: 45,
          color: AppColors.greenColor,
          child: Row(
            children: [
              AppSizedBoxes.sizedboxW5,
              Text(
                rating,
                style: const TextStyle(color: AppColors.whiteColor),
              ),
              const Icon(
                Icons.star,
                size: 18,
                color: AppColors.whiteColor,
              )
            ],
          ),
        ),
        AppSizedBoxes.sizedboxH8,
        ProductDescriptionStyleTwo(
          text1: linethroughPrice,
          text2: currentPrice,
          text3: offer,
          fontsize: 17,
          fonsize2: 18,
          // rating: 'dfd',
        ),
        AppSizedBoxes.sizedboxH8,
        Row(
          children: [
            const Icon(
              Icons.local_shipping_rounded,
              color: Colors.blue,
            ),
            kboxw5,
            const Text(
              'FREE Delivery',
              style: TextStyle(color: Colors.green),
            ),
            kboxw5,
            Text('₹$fee')
          ],
        ),
        // kbox20,
        // Container(
        //   padding: EdgeInsets.all(8),
        //   color: Colors.white,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Column(
        //         children: [
        //           Icon(
        //             Icons.repeat_on_rounded,
        //             color: Colors.orange,
        //           ),
        //           Text('Free 7 Day Replacement'),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Icon(Icons.currency_rupee_rounded),
        //           Text('Cash on Delivery available'),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        const Divider(
          thickness: 3,
          color: AppColors.whiteColor70,
        ),
      ],
    );
  }
}
