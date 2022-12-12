import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:zevoyi/controller/provider/login_provider.dart';
import 'package:zevoyi/view/home/widget/custom_elevatedbutton.dart';

import 'package:zevoyi/view/register/register_screen.dart';
import 'package:zevoyi/view/register/widgets/account_have_text.dart';
import 'package:zevoyi/view/home/widget/custom_textfiled.dart';
import '../../controller/provider/create_provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CreateAccountProvider>(context, listen: true);
    return Consumer<LoginProvider>(builder: (BuildContext context, value, _) {
      return Scaffold(body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kbox10,
                  Hero(
                    tag: 'logo',
                    child: const Text(
                      'Zevoi',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formGlobalKey,
                    child: Column(
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        kbox20,
                        CustomTextfiled(
                          hintText: 'Email',
                          eyebutton: null,
                          obscure: false,
                          controller: value.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          // errorText: 'Please enter your email',
                        ),
                        CustomTextfiled(
                          hintText: 'Password',
                          eyebutton: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              data.passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              data.eyefunction();
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          obscure: data.passwordVisible,
                          controller: value.passwordController,
                          // errorText: 'Please enter your password',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 27),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              kboxw20,
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'ForgetPassword?',
                                  style: TextStyle(fontWeight: FontWeight.w200),
                                ),
                              ),
                            ],
                          ),
                        ),
                        data.isLoading
                            ? const CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : CustomMainButton(
                                onPressed: () {
                                  if (formGlobalKey.currentState!.validate()) {
                                    formGlobalKey.currentState!.save();
                                    value.logIn(context);
                                  }
                                },
                                name: 'Login',
                              )
                      ],
                    ),
                  ),
                  BottomloginSignupText(
                    navpage: RegisterScreen(),
                    text1: 'Don\'t have an account?',
                    text2: ' Sign up',
                  ),
                  kbox10,
                ],
              ),
            );
          },
        ),
      ));
    });
  }
}
