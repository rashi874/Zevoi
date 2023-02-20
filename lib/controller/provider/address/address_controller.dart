
import 'package:flutter/material.dart';
import 'package:zevoyi/controller/provider/add_new_address/add_new_address_controller.dart';
import 'package:zevoyi/model/address/address_screen_enum_model.dart';
import 'package:zevoyi/routes/rout_names.dart';
import 'package:zevoyi/services/address/address_service.dart';
import 'package:zevoyi/utils/app_toast.dart';
import 'package:zevoyi/view/add_address/model/addaddress_arguement_model.dart';
import 'package:zevoyi/view/order_summery/model/order_summery_argument_model.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../model/order_summary/order_summary_screen_enum.dart';

class AddressProvider with ChangeNotifier {
  String? addressId;
  bool loading = false;

  void toOrderSummaryScreen(context, OrderSummaryScreenEnum screenCheck,
      String? productId, String? cartId) {
    if (addressId == null) {
      AppToast.showToast('Select an address', AppColors.redColor);
    } else {
      final args = OrderSummaryArguementModel(
        addressId: addressId!,
        screenCheck: screenCheck,
        productId: productId,
        cartId: cartId,
      );
      Navigator.of(context)
          .pushNamed(RouteNames.orderSummaryScreen, arguments: args);
    }
  }

  void toAddNewAddressScreen(context, AddressScreenEnum addressScreenCheck,
      AddNewAddressProvider provider) async {
    final args =
        AddNewAddressArguemnetModel(addressScreenCheck: addressScreenCheck);
    Navigator.of(context)
        .pushNamed(RouteNames.addNewAddressScreen, arguments: args)
        .then((value) {
      provider.getAllAddresses().then((value) {
        provider.addressChange(provider.addressList[0].id);
        addressId = provider.addressList[0].id;
      });
    });
  }

  void toEditAddressScreen(
      context, AddressScreenEnum addressScreenCheck, String addressId) {
    final args = AddNewAddressArguemnetModel(
        addressScreenCheck: addressScreenCheck, addressId: addressId);
    Navigator.of(context)
        .pushNamed(RouteNames.addNewAddressScreen, arguments: args);
  }

  void deleteAddress(String addressId) async {
    loading = true;
    notifyListeners();
    await AddressService().deleteAddress(addressId).then((value) {
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
