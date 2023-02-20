
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/add_new_address/add_new_address_controller.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';
import 'package:zevoyi/helper/sizedboxes/app_sizedboxes.dart';
import 'package:zevoyi/model/address/address_screen_enum_model.dart';
import 'package:zevoyi/utils/loading_widget.dart';
import 'package:zevoyi/view/add_address/widgets/address_type_widget.dart';
import 'package:zevoyi/view/add_address/widgets/custom_textformfield.dart';
import 'package:zevoyi/view/add_address/widgets/location_and_pincode.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({
    super.key,
    required this.addressScreenCheck,
    this.addressId,
  });

  final AddressScreenEnum addressScreenCheck;
  final String? addressId;

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AddNewAddressProvider addNewAddressProvider;
  @override
  void initState() {
    addNewAddressProvider =
        Provider.of<AddNewAddressProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addNewAddressProvider.setAddressScreen(
          widget.addressScreenCheck, widget.addressId);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('Add delivery address'),
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
        ),
        body: SingleChildScrollView(
          child: Consumer<AddNewAddressProvider>(builder: (context, values, _) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSizedBoxes.sizedboxH8,
                    CustomTextFormfield(
                      controller: values.fullNameController,
                      keyboardType: TextInputType.name,
                      action: TextInputAction.next,
                      icon: Icons.person,
                      hint: 'Full Name(Required)',
                      obscure: false,
                      validator: (value) => values.namesHouseandAreaValiator(
                        value,
                        'Please enter your first name',
                      ),
                    ),
                    AppSizedBoxes.sizedboxH8,
                    CustomTextFormfield(
                      controller: values.phoneNumberController,
                      keyboardType: TextInputType.phone,
                      action: TextInputAction.next,
                      icon: Icons.phone,
                      hint: 'Phone Number(Required)',
                      obscure: false,
                      validator: (value) => values.phoneNumberValidator(value),
                    ),
                    AppSizedBoxes.sizedboxH20,
                    const LocationAndPincode(),
                    AppSizedBoxes.sizedboxH20,
                    CustomTextFormfield(
                      controller: values.houseAndBuildingController,
                      keyboardType: TextInputType.streetAddress,
                      action: TextInputAction.next,
                      icon: Icons.house,
                      hint: 'House No., Building Name (Required)',
                      obscure: false,
                      validator: (value) => values.namesHouseandAreaValiator(
                        value,
                        'Please add your house no, building name',
                      ),
                    ),
                    AppSizedBoxes.sizedboxH8,
                    CustomTextFormfield(
                      controller: values.roadNameAreaColonyController,
                      keyboardType: TextInputType.streetAddress,
                      action: TextInputAction.done,
                      icon: Icons.bungalow_outlined,
                      hint: 'Road name, Area, Colony(Required)',
                      obscure: false,
                      validator: (value) => values.namesHouseandAreaValiator(
                        value,
                        'Please add your road name,area',
                      ),
                    ),
                    AppSizedBoxes.sizedboxH20,
                    const Text('Type of address'),
                    AppSizedBoxes.sizedboxH8,
                    const AddressTypeWidget(),
                    AppSizedBoxes.sizedboxH20,
                    GestureDetector(
                      onTap: () => values.saveAddress(
                        formKey.currentState!,
                        context,
                        widget.addressScreenCheck,
                        widget.addressId,
                      ),
                      child: values.loading2 == true
                          ? const LoadingWidget()
                          : Container(
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.blueColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(child: Text('Save Address')),
                            ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
