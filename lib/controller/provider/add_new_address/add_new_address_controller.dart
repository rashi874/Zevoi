import 'package:flutter/cupertino.dart';
import 'package:zevoyi/model/address/add_address_model.dart';
import 'package:zevoyi/model/address/address_screen_enum_model.dart';
import 'package:zevoyi/model/address/get_address_model.dart';
import 'package:zevoyi/services/address/address_service.dart';

class AddNewAddressProvider with ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController houseAndBuildingController =
      TextEditingController();
  final TextEditingController roadNameAreaColonyController =
      TextEditingController();
  bool homeSelected = true;
  bool loading = false;
  bool loading2 = false;
  List<AddressModel> addressList = [];
  AddNewAddressModel? address;
  AddressModel? singleAddress;
  String addressType = 'Home';
  String? addressGroupValue = 'address1';

  String? namesHouseandAreaValiator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length != 10) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  String? pinCodeValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your pincode';
    } else if (value.length != 6) {
      return 'Please enter valid pincode';
    }
    return null;
  }

  void selectAddressType() {
    homeSelected = !homeSelected;
    notifyListeners();
    homeSelected == true ? addressType = 'Home' : addressType = 'Office';
    notifyListeners();
  }

  void saveAddress(FormState currentState, BuildContext context,
      AddressScreenEnum addressScreenCheck, String? addressId) {
    if (currentState.validate()) {
      if (addressScreenCheck == AddressScreenEnum.addAddressScreen) {
        addNewAddress(context);
      } else {
        updateAddress(context, addressId!);
      }
    }
  }

  void addressChange(String? value) {
    addressGroupValue = value.toString();
    notifyListeners();
  }

  // Future<void> useMyLocation() async {
  //   loading = true;
  //   notifyListeners();
  //   await GeoLocationService().determinePosition().then((value) {
  //     if (value != null) {
  //       GeoLocationService()
  //           .getLocationAddress(value.latitude, value.longitude)
  //           .then((value) {
  //         if (value != null) {
  //           List a = value.region!.split(',').toList();
  //           pincodeController.text = value.postal.toString();
  //           cityController.text = value.city.toString();
  //           stateController.text = a[1];
  //           notifyListeners();
  //           loading = false;
  //           notifyListeners();
  //         } else {
  //           loading = false;
  //           notifyListeners();
  //         }
  //       });
  //     } else {
  //       loading = false;
  //       notifyListeners();
  //     }
  //   });
  // }

  Future<String?> getAllAddresses() async {
    loading = true;
    notifyListeners();
    await AddressService().getAllAddress().then((value) {
      if (value != null) {
        addressList = value;
        notifyListeners();

        loading = false;
        notifyListeners();
        return 'set';
      } else {
        loading = false;
        notifyListeners();
        return null;
      }
    });
    return null;
  }

  void addNewAddress(BuildContext context) async {
    loading2 = true;
    notifyListeners();
    final AddNewAddressModel model = AddNewAddressModel(
      addressType: addressType,
      name: fullNameController.text,
      contactNumber: phoneNumberController.text,
      pinCode: pincodeController.text,
      state: stateController.text,
      place: cityController.text,
      address: houseAndBuildingController.text,
      areaColony: roadNameAreaColonyController.text,
    );
    await AddressService().addAddress(model).then((value) {
      if (value != null) {
        clearControllers();
        Navigator.of(context).pop();
        loading2 = false;
        notifyListeners();
      } else {
        loading2 = false;
        notifyListeners();
      }
    });
  }

  void clearControllers() {
    fullNameController.clear();
    pincodeController.clear();
    stateController.clear();
    houseAndBuildingController.clear();
    roadNameAreaColonyController.clear();
    cityController.clear();
    phoneNumberController.clear();
    addressType = 'Home';
  }

  void updateAddress(BuildContext context, String addressId) async {
    loading2 = true;
    notifyListeners();
    final AddNewAddressModel model = AddNewAddressModel(
      addressType: addressType,
      name: fullNameController.text,
      contactNumber: phoneNumberController.text,
      pinCode: pincodeController.text,
      state: stateController.text,
      place: cityController.text,
      address: houseAndBuildingController.text,
      areaColony: roadNameAreaColonyController.text,
    );
    await AddressService().updateAddress(model, addressId).then((value) {
      if (value != null) {
        clearControllers();
        Navigator.of(context).pop();
        loading2 = false;
        notifyListeners();
      } else {
        loading2 = false;
        notifyListeners();
      }
    });
  }

  void getSingleAddress(String addressId) async {
    loading = true;
    notifyListeners();
    await AddressService().getSingleAddress(addressId).then((value) {
      if (value != null) {
        singleAddress = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void setAddressScreen(
      AddressScreenEnum addressScreenCheck, String? addressId) async {
    if (addressScreenCheck == AddressScreenEnum.addAddressScreen) {
      fullNameController.clear();
      cityController.clear();
      pincodeController.clear();
      roadNameAreaColonyController.clear();
      phoneNumberController.clear();
      houseAndBuildingController.clear();
      notifyListeners();
    } else {
      await AddressService().getSingleAddress(addressId!).then((value) {
        if (value != null) {
          fullNameController.text = value.fullName;
          cityController.text = value.place;
          pincodeController.text = value.pin;
          stateController.text = value.state;
          phoneNumberController.text = value.phone;
          roadNameAreaColonyController.text = value.landMark;
          houseAndBuildingController.text = value.address;
          notifyListeners();
          value.title == 'Home' ? homeSelected = true : homeSelected = false;
          notifyListeners();
        }
      });
    }
  }
}
