import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zevoyi/services/profile/profile_service.dart';

import '../../../routes/rout_names.dart';

class ProfileProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool loading = false;

  dynamic profile;

  void logOut(context) async {
    loading = true;
    notifyListeners();
    ProfileService().logOutUser().then((value) async {
      if (value != null) {
        await storage.delete(key: 'token');
        await storage.delete(key: 'refreshToken');
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  // void getCategories() async {
  //   loading = true;
  //   notifyListeners();
  //   await ProfileService().getProfiledata().then((value) {
  //     if (value != null) {
  //       profile = value;
  //       notifyListeners();
  //       loading = false;
  //       notifyListeners();
  //     } else {
  //       loading = false;
  //       notifyListeners();
  //       null;
  //     }
  //   });
  // }

  void goToSettingPage() {
    // code to go to settingpage
  }

  void goToAddressPage() {
    // final args = AddressScreenArguementModel(
    //   screenCheck: OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen,
    // );
    // Navigator.of(NavigationService.navigatorKey.currentContext!)
    //     .pushNamed(RouteNames.addressScreen, arguments: args);
  }

  void goToNotificationSettings() {
    // code to goto notification page
  }

  void aboutApp() {
    // code for about app
  }
}
