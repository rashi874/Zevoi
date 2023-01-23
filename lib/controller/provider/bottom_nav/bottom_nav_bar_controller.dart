import 'package:flutter/widgets.dart';
import 'package:zevoyi/view/cart/cart_screen.dart';

import '../../../../../view/home/home_screen.dart';

import '../../../view/profile/profile_screen.dart';
import '../../../view/wish_list/wish_list_screen.dart';

class BottomNavBarProvider with ChangeNotifier {
  int currentIndex = 0;

  final List<Widget> _bottomScreens = [
    const HomeScreen(),
    const WishListScreen(),
    const CartScreen(),
    const ProfileScreen(),
    // const WishListScreen(),
    // const OrdersScreen(),
    // const CartScreen(),
    // const ProfileScreen(),
  ];

  List<Widget> get bottomScreen => _bottomScreens;

  void newIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
