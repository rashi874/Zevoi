
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomloginSignupText extends StatelessWidget {
  final Widget navpage;
  final String text1;
  final String text2;

  const BottomloginSignupText({
    Key? key,
    required this.navpage,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text1,
          style: const TextStyle(
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: const TextStyle(
                  color: Color.fromRGBO(136, 215, 170, 1.000),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => navpage),
                    );
                    // navigate to desired screen
                  })
          ]),
    );
  }
}
