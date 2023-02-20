import 'package:flutter/material.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class OrderDetailProductContainer extends StatelessWidget {
  const OrderDetailProductContainer({
    super.key,
    required this.image,
    required this.productName,
    required this.qty,
    required this.size,
    required this.totalAmount,
  });
  final String image;
  final String productName;
  final String qty;
  final String size;
  final String totalAmount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                color: AppColors.whiteColor54,
                child: Image(
                  height: 140,
                  width: 140,
                  fit: BoxFit.fill,
                  image:
                      NetworkImage('http://${ApiUrl.url}:5005/products/$image'),
                ),
              ),
              AppSizedBoxes.sizedboxW10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(overflow: TextOverflow.fade),
                    ),
                    AppSizedBoxes.sizedboxH5,
                    Text('Quantity: $qty'),
                    AppSizedBoxes.sizedboxH5,
                    Text('Size: $size'),
                    AppSizedBoxes.sizedboxH5,
                    Text(
                      '₹$totalAmount',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
