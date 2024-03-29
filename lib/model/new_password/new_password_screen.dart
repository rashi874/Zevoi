import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/utils/loading_widget.dart';
import 'package:zevoyi/view/home/widget/custom_textfiled.dart';
import '../../controller/provider/new_password/new_password_controller.dart';
import '../sign_up_model/sign_up_model.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({
    super.key,
    required this.model,
  });
  final SignUpModel model;
  @override
  Widget build(BuildContext context) {
    final newPasswordProvider =
        Provider.of<NewPasswordProvider>(context, listen: false);
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: AppColors.transparentColor,
        title: const Text(
          'Create New Password',
          // style: AppTextStyles.appBarTextStyle,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Center(
                //   child: Image(
                //     image: AssetImage(
                //         'assets/create_new_password_screen_assets/create_new_password.png'),
                //   ),
                // ),
                // AppSizedBoxes.sizedboxH35,
                Consumer<NewPasswordProvider>(builder: (context, values, _) {
                  return CustomTextfiled(
                    controller: values.newPasswordController,
                    keyboardType: TextInputType.text,
                    action: TextInputAction.next,
                    icon: Icons.lock,
                    hint: 'New Password',
                    obscure: values.isVisible == false ? true : false,
                    validator: (value) => values.passwordValidation(value),
                    suffixIcon: values.isVisible == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixOntap: () => values.visibility(),
                  );
                }),
                // AppSizedBoxes.sizedboxH15,
                CustomTextfiled(
                  controller: newPasswordProvider.confirmPasswordController,
                  keyboardType: TextInputType.text,
                  action: TextInputAction.done,
                  icon: Icons.lock,
                  hint: 'Confirm password',
                  obscure: false,
                  validator: (value) =>
                      newPasswordProvider.confirmPasswordValidation(value),
                ),
                // AppSizedBoxes.sizedboxH50,
                Consumer<NewPasswordProvider>(builder: (context, values, _) {
                  return values.loading == true
                      ? const LoadingWidget()
                      : ElevatedButton(
                          onPressed: () {
                            values.success(
                              context,
                              model.email,
                            );
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
    );
  }
}
