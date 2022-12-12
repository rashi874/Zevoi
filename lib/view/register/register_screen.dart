import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:zevoyi/view/home/widget/custom_elevatedbutton.dart';
import 'package:zevoyi/view/login/login_screen.dart';
import 'package:zevoyi/view/register/widgets/account_have_text.dart';
import 'package:zevoyi/view/home/widget/custom_textfiled.dart';
import '../../controller/provider/create_provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      // constraints.maxHeight * 0.5;
      return Consumer<CreateAccountProvider>(
          builder: (BuildContext context, value, _) {
        return ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kbox20,
                const Text(
                  'Zevoi',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kbox10,
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
                        hintText: 'Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        eyebutton: null,
                        obscure: false,
                        controller: value.usernameController,
                      ),
                      CustomTextfiled(
                        hintText: 'Email',
                        eyebutton: null,
                        obscure: false,
                        controller: value.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      ),
                      CustomTextfiled(
                        hintText: 'Mobile',
                        eyebutton: null,
                        obscure: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                        controller: value.phoneController,
                      ),
                      CustomTextfiled(
                        hintText: 'Password',
                        eyebutton: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            value.passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            value.eyefunction();
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        obscure: value.passwordVisible,
                        controller: value.passwordController,
                      ),
                      CustomTextfiled(
                        hintText: 'Confirm Password',
                        obscure: value.passwordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter confirm password';
                          }
                          return null;
                        },
                        controller: value.confirmpasswordController,
                      ),
                      kbox20,
                      CustomMainButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            value.registerUser(context);
                          }
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
