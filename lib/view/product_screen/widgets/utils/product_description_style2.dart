import 'package:flutter/material.dart';
import 'package:zevoyi/core/constant/const.dart';
import '../../../../helper/colors/app_colors.dart';

class ProductDescriptionStyleTwo extends StatelessWidget {
  const ProductDescriptionStyleTwo({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.fontsize,
    required this.fonsize2,
    // required this.rating,
  });

  final String text1;
  final String text2;
  final String text3;
  // final String rating;
  final double fontsize;
  final double fonsize2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text3,
              style: TextStyle(
                color: AppColors.greenColor,
                overflow: TextOverflow.ellipsis,
                fontSize: fonsize2,
              ),
            ),
            kboxw5,
            Text(
              text2,
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  overflow: TextOverflow.ellipsis,
                  fontSize: fonsize2,
                  fontWeight: FontWeight.bold),
            ),
            kboxw5,
            Text(
              text1,
              style: TextStyle(
                color: const Color.fromARGB(137, 0, 0, 0),
                decoration: TextDecoration.lineThrough,
                overflow: TextOverflow.ellipsis,
                fontSize: fontsize,
              ),
            ),
            // AppSizedBoxes.sizedboxW5,
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            // Container(
            //   width: 45,
            //   color: const Color.fromARGB(153, 222, 67, 67),
            //   child: Row(
            //     children: [
            //       AppSizedBoxes.sizedboxW5,
            //       Text(
            //         rating,
            //         style: const TextStyle(color: AppColors.whiteColor),
            //       ),
            //       const Icon(
            //         Icons.star,
            //         size: 18,
            //         color: AppColors.whiteColor,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
