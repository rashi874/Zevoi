import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zevoyi/view/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(255, 255, 255, 255),
    ));
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      body: SizedBox(
        width: double.infinity,
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/splash.jpg'),
        //         fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Hero(
              tag: 'logo',
              child: Text(
                'Zevoi',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const Text(
              'E-Commerce App',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: const Text('Lets Go'))
          ],
        ),
      ),
    );
  }
}
