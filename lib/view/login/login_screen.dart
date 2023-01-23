import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:zevoyi/controller/provider/login_provider.dart';
import 'package:zevoyi/utils/loading_widget.dart';
import 'package:zevoyi/view/home/widget/custom_elevatedbutton.dart';
import 'package:zevoyi/view/register/register_screen.dart';
import 'package:zevoyi/view/register/widgets/account_have_text.dart';
import 'package:zevoyi/view/home/widget/custom_textfiled.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<SignUpProvider>(context, listen: true);
    return Consumer<LoginProvider>(
      builder: (BuildContext context, values, _) {
        return Scaffold(
            key: _scaffoldKey,
            body: ListView(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Zevoi',
                      style: TextStyle(
                        fontSize: 40,
                        // fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Icon(
                      Icons.line_axis,
                      size: 50,
                      color: Color.fromARGB(255, 220, 93, 93),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  height: 450,
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(208, 232, 232, 232),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            // color: Colors.white,
                          ),
                        ),
                        kbox20,
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
                          controller: values.passwordController,
                          keyboardType: TextInputType.text,
                          action: TextInputAction.next,
                          icon: Icons.lock,
                          hint: 'Password',
                          obscure: values.isNotVisible,
                          validator: (value) =>
                              values.passwordValidation(value),
                          suffixIcon: values.isNotVisible == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixOntap: () => values.passwordHide(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              kboxw20,
                              // kboxw20,
                              TextButton(
                                onPressed: () {
                                  values.toForgotPasswordScreen(context);
                                },
                                child: const Text(
                                  'ForgetPassword?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 49, 55, 49)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        values.loading == true
                            ? const LoadingWidget()
                            : CustomMainButton(
                                onPressed: () {
                                  values.login(context, formKey.currentState!);
                                },
                                name: 'Login',
                              )
                      ],
                    ),
                  ),
                ),
                kbox10,

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: BottomloginSignupText(
                      navpage: RegisterScreen(),
                      text1: 'Don\'t have an account?',
                      text2: ' Sign up',
                    ),
                  ),
                ),
                // kbox10,
              ],
            ));
      },
    );
  }
}
