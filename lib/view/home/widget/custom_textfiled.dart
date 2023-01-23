import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextfiled extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction action;
  final IconData icon;
  final String hint;
  final bool obscure;
  final String? Function(String?)? validator;
  final void Function()? suffixOntap;
  final IconData? suffixIcon;

  const CustomTextfiled({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.action,
    required this.icon,
    required this.hint,
    required this.obscure,
    required this.validator,
    this.suffixOntap,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        scrollPadding: const EdgeInsets.all(2),
        autofocus: false,
        keyboardType: keyboardType,
        obscureText: obscure,
        textInputAction: action,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          fillColor: const Color.fromARGB(15, 34, 15, 15),
          hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          suffixIcon: obscure == true
              ? IconButton(
                  onPressed: suffixOntap,
                  icon: Icon(
                    suffixIcon,
                    color: const Color.fromARGB(163, 27, 27, 27),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
