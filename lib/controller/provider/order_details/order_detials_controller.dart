import 'package:flutter/material.dart';
import 'package:zevoyi/controller/provider/orders/get_all_order_model.dart';
import 'package:zevoyi/services/orders/order_service.dart';

class OrderDetailsProvider with ChangeNotifier {
  OrderDetailsProvider() {
    startLoading();
  }
  bool loading = false;
  GetOrderModel? orderModel;
  String? orderedDate;
  String? deliveredDate;
  String? canceledDate;

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void setDates() {
    final a = orderModel!.orderDate.toString().split(' ');
    final b = orderModel!.deliveryDate.toString().split(' ');
    final c = orderModel?.cancelDate.toString().split('T');
    orderedDate = a[0];
    deliveredDate = b[0];
    canceledDate = c?[0] ?? '';
    notifyListeners();
  }

  void getSingleOrder(String orderId) async {
    loading = true;
    notifyListeners();
    await OrderServices().getSingleOrder(orderId).then((value) {
      if (value != null) {
        orderModel = value;
        notifyListeners();
        setDates();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  Future<void> cancelOrder(String orderId) async {
    loading = true;
    notifyListeners();

    await OrderServices().cancelOrder(orderId).then((value) {
      if (value != null) {
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
