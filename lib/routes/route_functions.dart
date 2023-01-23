import 'package:flutter/material.dart';
import 'package:zevoyi/routes/rout_names.dart';
import 'package:zevoyi/view/home/home_screen.dart';
import 'package:zevoyi/view/login/login_screen.dart';
import 'package:zevoyi/view/otp/otp_screen.dart';
import 'package:zevoyi/view/product_screen/product_screen.dart';
import 'package:zevoyi/view/register/register_screen.dart';
import 'package:zevoyi/view/screens/splash_screen.dart';

import '../model/new_password/model/newpassword_screen_model.dart';
import '../model/new_password/new_password_screen.dart';
import '../model/otp_model/otp_screen_arguement_model.dart';
import '../view/forgot_password/forgot_password_screen.dart';
import '../view/home/model/product_collection_model.dart';
import '../view/product_screen/products_collection_screen.dart';
import '../view/product_screen/widgets/utils/prouductid_model.dart';
import '../view/widgets/bottom_nav_bar.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case RouteNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case RouteNames.signInScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RouteNames.bottomNav:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case RouteNames.findMyAccount:
        return MaterialPageRoute(
          builder: (context) => ForgotPassword(),
        );
      case RouteNames.otpScreen:
        final args = settings.arguments as OtpArguementModel;
        return MaterialPageRoute(
            builder: (context) => OtpScreen(
                  model: args.model,
                  screenCheck: args.checkScreen,
                ));
      case RouteNames.newPasswordScreen:
        final args = settings.arguments as NewPasswordScreenArguementsModel;
        return MaterialPageRoute(
          builder: (context) => NewPasswordScreen(
            model: args.model,
          ),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.productCollections:
        final args = settings.arguments as ProductCollectionScreenModel;
        return MaterialPageRoute(
          builder: (context) => const ProductCollectionScreen(
              // category: args.category,
              // categoryId: args.categoryId,
              ),
        );
      case RouteNames.productScreen:
        final args = settings.arguments as ProductIdModel;
        return MaterialPageRoute(
          builder: (context) => ProductViewScreen(
            productId: args.productId, categoryId:args.categoryId,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
