import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({
    super.key,
    required this.name,
    required this.pinCode,
    required this.address,
    required this.ontap,
  });
  final String name;
  final String pinCode;
  final String address;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.62,
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Deliver to:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  AppSizedBoxes.sizedboxW3,
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSizedBoxes.sizedboxW3,
                  Text(', $pinCode')
                ],
              ),
              AppSizedBoxes.sizedboxH3,
              Text(
                address,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.dullWhitecolor),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: ontap,
                    child: const Text(
                      'Change',
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
