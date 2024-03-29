import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/add_new_address/add_new_address_controller.dart';
import 'package:zevoyi/controller/provider/address/address_controller.dart';
import 'package:zevoyi/model/address/address_screen_enum_model.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    required this.name,
    required this.addressType,
    required this.address,
    required this.phone,
    required this.addressId,
  });
  final String name;
  final String addressType;
  final String address;
  final String phone;
  final String addressId;
  @override
  Widget build(BuildContext context) {
    final addNewAddressProvider =
        Provider.of<AddNewAddressProvider>(context, listen: false);
    final addressProvider =
        Provider.of<AddressProvider>(context, listen: false);
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(59, 226, 115, 115),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Radio(
                  value: addressId,
                  groupValue: addNewAddressProvider.addressGroupValue,
                  onChanged: (value) {
                    addNewAddressProvider.addressChange(value);
                    addressProvider.addressId = addressId;
                  }),
              Text(name),
              AppSizedBoxes.sizedboxW5,
              Container(
                width: 46,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                  child: Text(
                    addressType,
                    style: const TextStyle(
                      color: Color.fromARGB(179, 9, 9, 9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 50,
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(179, 0, 0, 0)),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () => addressProvider.toEditAddressScreen(
                      context,
                      AddressScreenEnum.editAddressScreen,
                      addressId,
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Color.fromARGB(239, 176, 23, 23),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              AppSizedBoxes.sizedboxW3
            ],
          ),
          AppSizedBoxes.sizedboxH5,
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address),
                AppSizedBoxes.sizedboxH15,
                Text(phone),
                AppSizedBoxes.sizedboxH8,
              ],
            ),
          )
        ],
      ),
    );
  }
}
