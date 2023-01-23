import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;

  const ShimmerContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: borderRadius),
    );
  }
}
