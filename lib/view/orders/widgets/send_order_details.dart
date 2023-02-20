import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class SendOrderDetails extends StatelessWidget {
  const SendOrderDetails({
    super.key,
    required this.ontap,
  });
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          AppSizedBoxes.sizedboxW5,
          Container(
            height: 30,
            width: 30,
            color: AppColors.redColor,
            child: const Icon(Icons.share),
          ),
          AppSizedBoxes.sizedboxW15,
          const Text('Send order details to someone'),
          const Spacer(),
          GestureDetector(
            onTap: ontap,
            child: Container(
              height: 25,
              width: 55,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.dullWhitecolor),
              ),
              child: const Center(
                  child: Text(
                'Send',
                style: TextStyle(color: AppColors.blueColor),
              )),
            ),
          ),
          AppSizedBoxes.sizedboxW5,
        ],
      ),
    );
  }
}
