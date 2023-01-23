import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.icon,
  });
  final String text;
  final void Function()? onTap;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.dullWhitecolor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            AppSizedBoxes.sizedboxW5,
            Text(text)
          ],
        ),
      ),
    );
  }
}
