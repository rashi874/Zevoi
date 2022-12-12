import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextfiled extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final IconButton? eyebutton;
  final TextEditingController controller;
  bool obscure;
  final String? errorText;

  CustomTextfiled({
    Key? key,
    required this.hintText,
    this.errorText,
    this.eyebutton,
    required this.obscure,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        scrollPadding: const EdgeInsets.all(2),
        controller: controller,
        validator: validator,
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          fillColor: Colors.white,
          hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          suffixIcon: eyebutton,
        ),
      ),
    );
  }
}
