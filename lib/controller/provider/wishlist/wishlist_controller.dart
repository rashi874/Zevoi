import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zevoyi/services/wishList/wish_list_services.dart';
import '../../../model/wish_list_model/wish_list_model.dart';
import '../../../routes/rout_names.dart';
import '../../../utils/app_toast.dart';

class WishListProvider with ChangeNotifier {
  WishListProvider() {
    startLoading();
    getWishListItems();
  }
  bool iconload = false;
  bool loading = false;
  WishListModel? wishList;
  List favouriteProducts = [];
  IconData icon = Icons.favorite_outlined;

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void toCartScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.cartScreen);
  }

  void getWishListItems() async {
    loading = true;
    notifyListeners();
    await WishListService().getWishListItems().then(
      (value) {
        if (value != null) {
          wishList = value;
          notifyListeners();
          favouriteProducts =
              wishList!.products.map((e) => e.product.id).toList();
          notifyListeners();
          loading = false;
          notifyListeners();
        } else {
          loading = false;
          notifyListeners();
        }
      },
    );
  }

  void addOrRemoveFromWishList(String productId) async {
    loading = true;
    notifyListeners();
    await WishListService().addOrRemoveFromWishList(productId).then(
      (value) {
        if (value != null) {
          log(value.toString());
          WishListService().getWishListItems().then(
            (value) {
              if (value != null) {
                wishList = value;
                log(wishList.toString());
                notifyListeners();
                getWishListItems();
                notifyListeners();
                loading = false;
                notifyListeners();
              } else {
                loading = false;
                notifyListeners();
              }
            },
          );
          if (value == 201) {
            AppToast.showToast('Item added to Wishlist', Colors.green);
            icon = Icons.favorite;
            notifyListeners();
          } else if (value == 204) {
            AppToast.showToast('Item removed from Wishlist', Colors.green);
            icon = Icons.favorite_outline_outlined;
            notifyListeners();
          }
        } else {
          loading = false;
          notifyListeners();
        }
      },
    );
  }

  //9 Icon(
  //   values2.favouriteProducts.contains(values.product!.id)
  //       ? Icons.favorite
  //       : Icons.favorite_outline_outlined,
  //   color: values2.favouriteProducts.contains(values.product!.id)
  //       ? AppColors.redColor
  //       : AppColors.blackcolor,
  //   size: 30,
  // );

}
