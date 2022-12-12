import 'package:flutter/material.dart';
import 'package:zevoyi/model/sign_up_model/sign_up_model.dart';
import 'package:zevoyi/view/home/home_screen.dart';
import '../../services/signup_api_service/signup_services.dart';

class CreateAccountProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  bool passwordVisible = true;
  SignupServices signupServices = SignupServices();
  bool isLoading = false;

  eyefunction() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  // validation(context, formGlobalKey) {
  //   if (formGlobalKey.currentState!.validate()) {
  //     formGlobalKey.currentState!.save();
  //     registerUser(context);
  //   } else {
  //     return null;
  //   }
  // }

  // bool get isValidEmail {
  //   final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  //   return emailRegExp.hasMatch(this);
  // }

  Future<void> registerUser(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final signupUser = SignupModel(
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
      username: usernameController.text,
    );

    signupServices.signupUser(signupUser, context).then(
      (value) {
        if (value != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),
          );
          disposeTextfield();
        } else {
          return;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  bool obscureText = true;
  // Icon icon = const Icon(
  //   Icons.visibility_off,
  //   color: kWhite,
  // );

  // void visibility() {
  //   if (obscureText == false) {
  //     icon = const Icon(
  //       Icons.visibility_off,
  //       color: kWhite,
  //     );
  //     obscureText = true;
  //     notifyListeners();
  //   } else {
  //     icon = const Icon(
  //       Icons.visibility,
  //       color: kWhite,
  //     );
  //     obscureText = false;
  //     notifyListeners();
  //   }
  // }

  void disposeTextfield() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    confirmpasswordController.clear();
  }
}
