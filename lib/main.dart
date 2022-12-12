import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/login_provider.dart';
import 'package:zevoyi/controller/provider/profile_provider.dart';
import 'package:zevoyi/core/constant/style.dart';
import 'package:zevoyi/view/home/home_screen.dart';
import 'package:zevoyi/view/login/login_screen.dart';
import 'package:zevoyi/view/screens/splash_screen.dart';
import 'controller/provider/create_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  bool get isDarkTheme => false;
  bool get islightheme => true;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CreateAccountProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(isDarkTheme, context),
        darkTheme: Styles.themeData(islightheme, context),
        home: const SplashScreen(),
      ),
    );
  }
}

//mor_2314
//83r5^_
//rashidrashi023@gmail.com
//rashid@1