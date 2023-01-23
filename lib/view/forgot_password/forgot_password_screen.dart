import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/utils/loading_widget.dart';

import '../../controller/provider/forgot_password/forgot_password_controller.dart';
import '../home/widget/custom_textfiled.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text(
            'Find your Account',
            // style: AppTextStyles.appBarTextStyle,
          ),
          elevation: 0,
          // backgroundColor: AppColors.transparentColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const Image(
                    //   height: 200,
                    //   width: 200,
                    //   // image: AssetImage(
                    //   //     'assets/forgot_ password_screen_assets/start.png'),
                    // ),
                    // AppSizedBoxes.sizedboxH35,
                    CustomTextfiled(
                      controller: forgotPasswordProvider.findAccountController,
                      keyboardType: TextInputType.emailAddress,
                      action: TextInputAction.done,
                      icon: Icons.mail,
                      hint: 'Email',
                      obscure: false,
                      validator: (value) => forgotPasswordProvider
                          .findAccountTextfieldValidation(value),
                    ),
                    // AppSizedBoxes.sizedboxH50,
                    Consumer<ForgotPasswordProvider>(
                        builder: (context, values, _) {
                      return values.loading == true
                          ? const LoadingWidget()
                          : ElevatedButton(
                              onPressed: () {
                                values.toOtpScreen(
                                    context, formKey.currentState!);
                              },
                              child: const Text(
                                'Continue',
                              ),
                            );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
