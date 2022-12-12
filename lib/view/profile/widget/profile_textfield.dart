import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserTextfield extends StatelessWidget {
  final String hinttexts;
  final IconButton? eyebutton;
  final TextEditingController controller;
  bool obscure;
  
  String msg;

  UserTextfield({
    Key? key,
    required this.hinttexts,
    required this.msg,
    this.eyebutton,
    required this.obscure,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlign: TextAlign.center,
        scrollPadding: const EdgeInsets.all(2),
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return msg;
          }
          return null;
        },
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          fillColor: const Color.fromARGB(255, 223, 223, 223),
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          hintText: hinttexts,
          suffixIcon: eyebutton,
        ));
  }
}
