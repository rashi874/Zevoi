import 'package:flutter/material.dart';
import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class ProductTextdesciptionStyle extends StatelessWidget {
  const ProductTextdesciptionStyle({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    this.fontsize = 14,
    required this.name,
  });
  final String name;
  final String text1;
  final String text2;
  final String text3;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 220,
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w600),
              maxLines: 2,
            ),
          ),
          Text(
            text1,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.lineThrough,
                color: Color.fromARGB(179, 76, 75, 75)),
          ),
          Text(
            text2,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            text3,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColors.greenColor, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}


// Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           text1,
//           style: TextStyle(
//             color: AppColors.whiteColor54,
//             decoration: TextDecoration.lineThrough,
//             overflow: TextOverflow.ellipsis,
//             fontSize: fontsize,
//           ),
//         ),
//         AppSizedBoxes.sizedboxW10,
//         Text(
//           text2,
//           style: TextStyle(
//             color: AppColors.whiteColor,
//             overflow: TextOverflow.ellipsis,
//             fontSize: fontsize,
//           ),
//         ),
//         AppSizedBoxes.sizedboxW10,
//         Text(
//           text3,
//           style: TextStyle(
//             color: AppColors.greenColor,
//             overflow: TextOverflow.ellipsis,
//             fontSize: fontsize,
//           ),
//         ),
//       ],
//     );