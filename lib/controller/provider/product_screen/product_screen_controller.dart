import 'package:flutter/cupertino.dart';
import 'package:zevoyi/routes/rout_names.dart';
import 'package:zevoyi/services/home/home_service.dart';
import '../../../model/home_models/product_model.dart';
import '../../../model/order_summary/order_summary_screen_enum.dart';
import '../../../view/address/model/address_screen_arguement_model.dart';

class ProductProvider with ChangeNotifier {
  ProductProvider() {
    loadingStart();
  }
  int? sizeChartIndex;
  bool loading = false;
  Product? product;
  String? productId;
  String? productSize = '4';

  void goToCart(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.cartScreen);
  }

  void toAddressScreen(context, OrderSummaryScreenEnum orderScreenCheck,
      String? cartId, String? productId) {
    final args = AddressScreenArguementModel(
      screenCheck: orderScreenCheck,
      cartId: cartId,
      productId: productId,
      visibility: true,
    );
    if (productSize != null) {
      Navigator.of(context).pushNamed(
        RouteNames.addressScreen,
        arguments: args,
      );
    } else {
      return;
    }
  }

  // void sizeSelect(int index) {
  //   sizeChartIndex = index;
  //   notifyListeners();
  //   productSize = product!.size[index].toString();
  //   notifyListeners();
  // }

  void getAProduct() async {
    loading = true;
    notifyListeners();
    await HomeService().getAProduct(productId!).then((value) {
      if (value != null) {
        sizeChartIndex = null;
        notifyListeners();
        product = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  void loadingStart() {
    loading = true;
    notifyListeners();
  }
}
