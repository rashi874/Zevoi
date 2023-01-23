import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/bottom_nav/bottom_nav_bar_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider =
        Provider.of<BottomNavBarProvider>(context, listen: false);
    return Scaffold(
      body: (context)
          .watch<BottomNavBarProvider>()
          .bottomScreen[bottomNavBarProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: bottomNavBarProvider.currentIndex,
        onTap: (newIndex) => bottomNavBarProvider.newIndex(newIndex),
        selectedItemColor: const Color.fromARGB(255, 220, 93, 93),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        selectedLabelStyle: const TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        // backgroundColor: Colors.amber[200],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.line_axis,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Whishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
