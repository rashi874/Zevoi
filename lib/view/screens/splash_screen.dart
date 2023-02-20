import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/core/constant/const.dart';
import '../../controller/provider/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashProvider.splash(context);
    });
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarIconBrightness: Brightness.dark,
    //     systemNavigationBarColor: Color.fromARGB(255, 255, 255, 255),
    //     systemNavigationBarIconBrightness: Brightness.dark,
    //     systemNavigationBarDividerColor: Color.fromARGB(255, 255, 255, 255),
    //     // systemStatusBarContrastEnforced: true,
    //     // systemNavigationBarContrastEnforced: true,
    //     statusBarColor: Color.fromARGB(0, 250, 250, 250),
    //     statusBarBrightness: Brightness.dark,
    //   ),
    // );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kbox10,
            Column(
              children: const [
                Text(
                  'Zevoi',
                  style: TextStyle(
                    fontSize: 35,
                    // fontFamily: 'Quicksand',
                    color: Color.fromARGB(255, 207, 205, 92),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Ecommerce App',
                  style: TextStyle(
                    fontSize: 20,
                    // fontFamily: 'Quicksand',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.line_axis,
                size: 50,
                color: Color.fromARGB(255, 207, 205, 92),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
