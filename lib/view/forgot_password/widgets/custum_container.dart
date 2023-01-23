import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.image,
    required this.text,
    required this.color,
  });
  final String image;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(
          // color: AppColors.lightDarkBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // AppSizedBoxes.sizedboxW15,
          CircleAvatar(
            // backgroundColor: AppColors.darkShadeBackgroundColor,
            radius: 40,
            child: Image(
              height: 40,
              width: 40,
              image: AssetImage(image),
            ),
          ),
          // AppSizedBoxes.sizedboxW15,
          Text(text)
        ],
      ),
    );
  }
}
