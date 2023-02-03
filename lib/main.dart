import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/bottom_nav/bottom_nav_bar_controller.dart';
import 'package:zevoyi/controller/provider/cart/cart_controller.dart';
import 'package:zevoyi/controller/provider/profile/profile_controller.dart';
import 'package:zevoyi/controller/provider/home/home_screen_controller.dart';
import 'package:zevoyi/controller/provider/login_provider.dart';
import 'package:zevoyi/controller/provider/new_password/new_password_controller.dart';
import 'package:zevoyi/controller/splash/splash_controller.dart';
import 'package:zevoyi/routes/route_functions.dart';
import 'package:zevoyi/view/product_screen/products_collection_screen.dart';
import 'package:zevoyi/view/screens/splash_screen.dart';
import 'controller/provider/product_screen/product_screen_controller.dart';
import 'controller/provider/forgot_password/forgot_password_controller.dart';
import 'controller/provider/otp/otp_screen_controller.dart';
import 'controller/provider/signup_provider.dart';
import 'controller/provider/wishlist/wishlist_controller.dart';

void main() {
  runApp(const MyApp());
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.grey[50],
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.grey[50],
      // systemStatusBarContrastEnforced: true,
      // systemNavigationBarContrastEnforced: true,
      statusBarColor: const Color.fromARGB(0, 250, 250, 250),
      statusBarBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SignUpProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (context) => NewPasswordProvider()),
        ChangeNotifierProvider(create: (context) => OtpScreenProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: MaterialApp(
        routes: {
          ProductCollectionScreen.routeName: (context) =>
              const ProductCollectionScreen()
        },
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto-Regular',
          useMaterial3: true,
          colorSchemeSeed: Color.fromARGB(255, 255, 135, 29),
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
        home: const SplashScreen(),
      ),
    );
  }
}
