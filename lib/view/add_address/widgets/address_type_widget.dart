
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/add_new_address/add_new_address_controller.dart';
import 'package:zevoyi/helper/sizedboxes/app_sizedboxes.dart';

import '../../../helper/colors/app_colors.dart';

class AddressTypeWidget extends StatelessWidget {
  const AddressTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewAddressProvider>(builder: (context, values, _) {
      return Row(
        children: [
          GestureDetector(
            onTap: () => values.selectAddressType(),
            child: Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: values.homeSelected == true
                      ? AppColors.blueColor
                      : AppColors.whiteColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color: values.homeSelected == true
                        ? AppColors.blueColor
                        : AppColors.whiteColor,
                  ),
                  AppSizedBoxes.sizedboxW3,
                  Text(
                    'Home',
                    style: TextStyle(
                      color: values.homeSelected == true
                          ? AppColors.blueColor
                          : AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSizedBoxes.sizedboxW10,
          GestureDetector(
            onTap: () => values.selectAddressType(),
            child: Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: values.homeSelected == false
                      ? AppColors.blueColor
                      : AppColors.whiteColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_city,
                    color: values.homeSelected == false
                        ? AppColors.blueColor
                        : AppColors.whiteColor,
                  ),
                  AppSizedBoxes.sizedboxW3,
                  Text(
                    'Office',
                    style: TextStyle(
                      color: values.homeSelected == false
                          ? AppColors.blueColor
                          : AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
