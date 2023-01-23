import 'package:flutter/material.dart';

import '../../../model/address/model/address_screen_arguement_model.dart';
import '../../../model/cart/add_to_cart_model.dart';
import '../../../model/cart/get_from_cart_model.dart';
import '../../../model/order_summary/order_summary_screen_enum.dart';
import '../../../routes/rout_names.dart';
import '../../../services/cart/cart_service.dart';
import '../../../utils/app_toast.dart';

class CartProvider with ChangeNotifier {
  CartProvider() {
    startLoading();
  }
  CartGetModel? cartList;
  bool loading = false;
  int quantity = 1;
  List<String> cartItemsId = [];
  List<String> cartitemsPayId = [];
  int? totalSave;
  int? totalProductCount;

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void getCartItems() async {
    loading = true;
    notifyListeners();
    await CartService().getCartItems().then((value) {
      if (value != null) {
        cartList = value;
        notifyListeners();
        totalProductsCount();
        cartItemsId = cartList!.products.map((e) => e.product.id).toList();
        cartitemsPayId = cartList!.products.map((e) => e.id).toList();
        totalSave =
            cartList!.totalDiscount.toInt() - cartList!.totalPrice.toInt();
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  Future<void> addToCart(
      String productId,
      //  String? productSize,
      OrderSummaryScreenEnum? screenCheck) async {
    // if (productSize == null) {
    //   AppToast.showToast('Select size', Colors.red);
    // } else {
    final AddToCartModel model = AddToCartModel(
      productId: productId,
      quantity: quantity,
      // size: productSize.toString(),
    );
    await CartService().addToCart(model).then((value) {
      if (value != null) {
        getCartItems();
        if (value == 'product added to cart successfully') {
          screenCheck != OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen
              ? AppToast.showToast(
                  'Product added to cart',
                  Colors.green,
                )
              : null;
        } else {
          null;
        }
      } else {
        null;
      }
    });
    // }
  }

  void totalProductsCount() {
    int count = 0;
    for (var i = 0; i < cartList!.products.length; i++) {
      count = count + cartList!.products[i].qty;
    }
    totalProductCount = count;
    notifyListeners();
  }

  void removeFromCart(String productId) async {
    loading = true;
    notifyListeners();
    await CartService().removeFromCart(productId).then((value) {
      if (value != null) {
        getCartItems();
        AppToast.showToast('Item removed from cart', Colors.green);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  Future<void> incrementOrDecrementQuantity(int qty, String productId,
      String productSize, int productquantity) async {
    final AddToCartModel model = AddToCartModel(
      productId: productId,
      quantity: qty,
      // size: productSize.toString(),
    );
    if (qty == 1 && productquantity >= 1 || qty == -1 && productquantity > 1) {
      await CartService().addToCart(model).then((value) async {
        if (value != null) {
          await CartService().getCartItems().then((value) {
            if (value != null) {
              cartList = value;
              notifyListeners();
              totalProductsCount();
              cartItemsId =
                  cartList!.products.map((e) => e.product.id).toList();
              notifyListeners();
              totalSave = cartList!.totalDiscount.toInt() -
                  cartList!.totalPrice.toInt();
              notifyListeners();
            } else {
              null;
            }
          });
        } else {
          null;
        }
      });
    } else {
      null;
    }
  }

  void toAddressScreen(
    BuildContext context,
    OrderSummaryScreenEnum orderScreenCheck,
    String? cartId,
    String? productId,
  ) {
    final args = AddressScreenArguementModel(
      screenCheck: orderScreenCheck,
      cartId: cartId,
      productId: productId,
      visibility: true,
    );
    Navigator.of(context).pushNamed(
      RouteNames.addressScreen,
      arguments: args,
    );
  }
}
