import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: isDarkTheme
            ? const Color.fromRGBO(26, 28, 27, 1.000)
            : const Color.fromRGBO(246, 246, 246, 1.000),
        statusBarColor: isDarkTheme
            ? const Color.fromRGBO(26, 28, 27, 1.000)
            : const Color.fromRGBO(246, 246, 246, 1.000),
      ),
    );

    return ThemeData(
      fontFamily: 'Manrope',
      // useMaterial3: true,
      primarySwatch: Colors.blueGrey,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Colors.black : const Color(0xffF1F5FB),
      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor: isDarkTheme
          ? const Color(0xff280C0B)
          : const Color.fromARGB(255, 53, 53, 53),
      highlightColor:
          isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme
          ? const Color(0xFF151515)
          : const Color.fromARGB(255, 255, 255, 255),
      canvasColor: isDarkTheme
          ? const Color.fromRGBO(26, 28, 27, 1.000)
          : const Color.fromRGBO(246, 246, 246, 1.000),
      // brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      // appBarTheme: AppBarTheme(
      //   elevation: 0.0,
      //   backgroundColor: isDarkTheme
      //       ? const Color.fromRGBO(26, 28, 27, 1.000)
      //       : const Color.fromRGBO(246, 246, 246, 1.000),
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: isDarkTheme
      //         ? const Color.fromRGBO(26, 28, 27, 1.000)
      //         : const Color.fromRGBO(246, 246, 246, 1.000), // <-- SEE HERE
      //     // statusBarIconBrightness:
      //     //     Brightness.dark, //<-- For Android SEE HERE (dark icons)
      //     // statusBarBrightness:
      //     //     Brightness.light, //<-- For iOS SEE HERE (dark icons)
      //   ),
      // ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme
              ? Colors.white
              : const Color.fromARGB(255, 214, 214, 214)),
    );
  }
}
