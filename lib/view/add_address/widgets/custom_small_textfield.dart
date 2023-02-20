import 'package:flutter/material.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';

class CustomSmallTextFormfield extends StatelessWidget {
  const CustomSmallTextFormfield({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.action,
    required this.hint,
    required this.validator,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction action;
  final String hint;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: TextFormField(
        autofocus: false,
        keyboardType: keyboardType,
        textInputAction: action,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          fillColor: AppColors.lightDarkBackgroundColor,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.whiteColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
