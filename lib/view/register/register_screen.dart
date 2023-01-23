import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:zevoyi/view/home/widget/custom_elevatedbutton.dart';
import 'package:zevoyi/view/login/login_screen.dart';
import 'package:zevoyi/view/register/widgets/account_have_text.dart';
import 'package:zevoyi/view/home/widget/custom_textfiled.dart';
import '../../controller/provider/signup_provider.dart';
import '../../utils/loading_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      // constraints.maxHeight * 0.5;
      return Consumer<SignUpProvider>(
          builder: (BuildContext context, values, _) {
        return ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Zevoi',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.line_axis,
                      size: 50,
                      color: Color.fromARGB(255, 220, 93, 93),
                    ),
                  ],
                ),
                kbox20,
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      kbox20,
                      CustomTextfiled(
                        controller: values.nameController,
                        keyboardType: TextInputType.name,
                        action: TextInputAction.next,
                        icon: Icons.person,
                        hint: 'Full name',
                        obscure: false,
                        validator: (value) => values.nameValidation(value),
                      ),
                      CustomTextfiled(
                        controller: values.emailController,
                        keyboardType: TextInputType.emailAddress,
                        action: TextInputAction.next,
                        icon: Icons.mail,
                        hint: 'Email',
                        obscure: false,
                        validator: (value) => values.emailValidation(value),
                      ),
                      CustomTextfiled(
                        controller: values.mobileNumberController,
                        keyboardType: TextInputType.phone,
                        action: TextInputAction.next,
                        icon: Icons.numbers,
                        hint: 'Mobile number',
                        obscure: false,
                        validator: (value) => values.numberValidation(value),
                      ),
                      CustomTextfiled(
                        controller: values.passwordController,
                        keyboardType: TextInputType.text,
                        action: TextInputAction.next,
                        icon: Icons.lock,
                        hint: 'Password',
                        obscure: values.isNotVisible,
                        validator: (value) => values.passwordValidation(value),
                        suffixIcon: values.isNotVisible == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixOntap: () => values.passwordHide(),
                      ),
                      CustomTextfiled(
                        controller: values.confirmPasswordController,
                        keyboardType: TextInputType.text,
                        action: TextInputAction.done,
                        icon: Icons.lock,
                        hint: 'Confirm password',
                        obscure: false,
                        validator: (value) =>
                            values.confirmPasswordValidation(value),
                      ),
                      kbox20,
                      values.loading == true
                          ? const LoadingWidget()
                          : CustomMainButton(
                              onPressed: () {
                                values.toSignUpOtpScreen(
                                    context, formKey.currentState!);
                              },
                              name: 'Register',
                            ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 0.2,
                      ),
                      BottomloginSignupText(
                        navpage: LoginScreen(),
                        text1: 'Already have an account?',
                        text2: ' Login',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      });
    }));
  }
}
