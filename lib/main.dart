import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/add_new_address/add_new_address_controller.dart';
import 'package:zevoyi/controller/provider/address/address_controller.dart';
import 'package:zevoyi/controller/provider/bottom_nav/bottom_nav_bar_controller.dart';
import 'package:zevoyi/controller/provider/cart/cart_controller.dart';
import 'package:zevoyi/controller/provider/forgot_password/forgot_password_controller.dart';
import 'package:zevoyi/controller/provider/home/home_screen_controller.dart';
import 'package:zevoyi/controller/provider/login_provider.dart';
import 'package:zevoyi/controller/provider/new_password/new_password_controller.dart';
import 'package:zevoyi/controller/provider/order_controller/myorder_controller.dart';
import 'package:zevoyi/controller/provider/order_details/order_detials_controller.dart';
import 'package:zevoyi/controller/provider/order_summary/order_summary_controller.dart';
import 'package:zevoyi/controller/provider/otp/otp_screen_controller.dart';
import 'package:zevoyi/controller/provider/payments/payments_controller.dart';
import 'package:zevoyi/controller/provider/product_screen/product_screen_controller.dart';
import 'package:zevoyi/controller/provider/profile/profile_controller.dart';
import 'package:zevoyi/controller/provider/signup_provider.dart';
import 'package:zevoyi/controller/provider/splash/splash_controller.dart';
import 'package:zevoyi/controller/provider/wishlist/wishlist_controller.dart';
import 'package:zevoyi/routes/route_functions.dart';

import 'view/product_screen/products_collection_screen.dart';
import 'view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromARGB(255, 255, 255, 255),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Color.fromARGB(255, 255, 255, 255),
      // systemStatusBarContrastEnforced: true,
      // systemNavigationBarContrastEnforced: true,
      statusBarColor: Color.fromARGB(0, 250, 250, 250),
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
        ChangeNotifierProvider(create: (context) => OtpScreenProvider()),
        ChangeNotifierProvider(create: (context) => NewPasswordProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderSummaryProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => AddNewAddressProvider()),
        ChangeNotifierProvider(create: (context) => OrderDetailsProvider()),
        ChangeNotifierProvider(create: (context) => MyOrdersProvider()),
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
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          // primaryColor: Colors.blue,
          // primarySwatch: Colors.blue,
          colorSchemeSeed: const Color.fromARGB(255, 255, 251, 6),
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
        home: const SplashScreen(),
      ),
    );
  }
}
