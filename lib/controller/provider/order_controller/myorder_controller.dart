import 'package:flutter/material.dart';
import 'package:zevoyi/controller/provider/orders/get_all_order_model.dart';
import 'package:zevoyi/routes/rout_names.dart';
import 'package:zevoyi/services/orders/order_service.dart';
import 'package:zevoyi/view/order_detials_screen/model/order_detail_argument_model.dart';

class MyOrdersProvider with ChangeNotifier {
  MyOrdersProvider() {
    startLoading();
  }
  List<GetOrderModel>? ordersList;
  bool loading = false;
  GetOrderModel? singleModel;
  String? deliveryDate;

  void getAllOrders() async {
    await OrderServices().getAllOrders().then((value) {
      if (value != null) {
        ordersList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  String? formatDate(String date) {
    final a = date.split(' ');
    return a[0];
  }

  String? formatCancelDate(String? date) {
    if (date != null) {
      final a = date.split('T');
      return a[0];
    } else {
      return null;
    }
  }

  void getSingleOrder(String orderId) async {
    await OrderServices().getSingleOrder(orderId).then((value) {
      if (value != null) {
        singleModel = value;
        notifyListeners();
        deliveryDate = formatDate(singleModel!.deliveryDate.toString());
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void closeOrderPlacedScreen(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
  }

  void gotoOrderDetailsFromOrderScreen(
      BuildContext context, String orderId, int index) {
    final OrderDetailsArguementModel args =
        OrderDetailsArguementModel(orderIndex: index, orderId: orderId);
    Navigator.of(context)
        .pushNamed(RouteNames.orderDetailsScreen, arguments: args)
        .then((value) {
      loading = true;
      notifyListeners();
      getAllOrders();
    });
  }

  void goToHomePage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
  }

  // void sendOrderDetials(context) {
  //   Share.share(
  //       "ShoeCart Order -Order Id:${singleModel!.id},Total Products:${singleModel!.products.length},Total Price:${singleModel!.totalPrice},Delivery Date:$deliveryDate");
  // }
}
