import 'package:flutter/material.dart';
import 'package:zevoyi/view/cart/widgets/proudct_quantity.dart';
import 'package:zevoyi/view/cart/widgets/prouduct_descripton.dart';
import '../../../core/api/api_baseurl.dart';
import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({
    super.key,
    required this.image,
    required this.proudctName,
    required this.size,
    required this.prouductPrice,
    required this.linethroughPrice,
    required this.offer,
    required this.ontap1,
    required this.ontap2,
    required this.quantity,
  });
  final String image;
  final String proudctName;
  final String size;
  final int prouductPrice;
  final String linethroughPrice;
  final String offer;
  final void Function() ontap1;
  final void Function() ontap2;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  color: AppColors.whiteColor54,
                  child: Image(
                    height: 110,
                    // width: 110,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'http://${ApiUrl.url}:5005/products/$image'),
                  ),
                ),
              ],
            ),
            AppSizedBoxes.sizedboxW15,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSizedBoxes.sizedboxH5,
                  Text(
                    proudctName,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  AppSizedBoxes.sizedboxH5,
                  // Text('Size: $size'),
                  AppSizedBoxes.sizedboxH5,
                  CartPruductTextStyle(
                    text1: linethroughPrice,
                    text2: prouductPrice,
                    text3: offer,
                  ),
                  AppSizedBoxes.sizedboxH12,
                  ProductQuantity(
                    ontap1: ontap1,
                    ontap2: ontap2,
                    quantity: quantity,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
