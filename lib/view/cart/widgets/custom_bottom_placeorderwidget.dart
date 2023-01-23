import 'package:flutter/cupertino.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';
import 'package:zevoyi/helper/sizedboxes/app_sizedboxes.dart';

class CustomBottomPlaceOrderWidget extends StatelessWidget {
  const CustomBottomPlaceOrderWidget({
    super.key,
    required this.ontap,
    required this.totalAmount,
  });
  final void Function() ontap;
  final String totalAmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(
          top: BorderSide(
            color: AppColors.dullWhitecolor,
          ),
        ),
      ),
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            AppSizedBoxes.sizedboxW15,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total Amount',
                ),
                Text(
                  '₹$totalAmount',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: ontap,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: AppColors.yellowColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    'Place Order',
                    style: TextStyle(
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            AppSizedBoxes.sizedboxW10,
          ],
        ),
      ),
    );
  }
}
