import 'package:flutter/material.dart';

class CustomBottomContainer extends StatelessWidget {
  const CustomBottomContainer({
    super.key,
    required this.containerColor,
    required this.text,
    required this.ontap,
    required this.fontcolor,
    
  });
  final Color containerColor;
  final Color fontcolor;
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 2,
        color: containerColor,
        child: Center(
          child: Text(
            text,
            style:  TextStyle(
              color:fontcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
