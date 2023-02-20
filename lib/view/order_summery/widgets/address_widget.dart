import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.name,
    required this.addressType,
    required this.address,
    required this.phone,
  });
  final String name;
  final String addressType;
  final String address;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Deliver to:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        AppSizedBoxes.sizedboxH5,
        Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSizedBoxes.sizedboxW3,
            Container(
              width: 46,
              height: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  addressType,
                  style: const TextStyle(
                    color: AppColors.dullWhitecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        AppSizedBoxes.sizedboxH15,
        Text(
          address,
        ),
        AppSizedBoxes.sizedboxH8,
        Text(phone),
      ],
    );
  }
}
