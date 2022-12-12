import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final void Function()? onPressed;
  final String name;

  const CustomMainButton({
    Key? key,
    this.onPressed,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              // side: BorderSide(color: Colors.red),
            ),
            backgroundColor: const Color.fromRGBO(136, 215, 170, 1.000),
            foregroundColor: Colors.white),
        onPressed: onPressed,
        child: Text(
          name,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
