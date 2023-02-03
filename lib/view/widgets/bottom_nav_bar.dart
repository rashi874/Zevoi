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
      bottomNavigationBar: NavigationBar(
        // backgroundColor: colors.onPrimary,
        // elevation: 10,
        selectedIndex: bottomNavBarProvider.currentIndex,
        onDestinationSelected: (index) {
          bottomNavBarProvider.newIndex(index);
        },
        // onTap: (newIndex) => bottomNavBarProvider.newIndex(newIndex),
        // selectedItemColor: Color.fromARGB(255, 209, 100, 117),
        // unselectedItemColor: Color.fromARGB(255, 23, 20, 24),
        // selectedLabelStyle: const TextStyle(
        //     color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        // // backgroundColor: Colors.amber[200],
        destinations: const [
          NavigationDestination(icon: Icon(Icons.line_axis), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Whishlist'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
