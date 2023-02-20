import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/add_new_address/add_new_address_controller.dart';
import 'package:zevoyi/controller/provider/address/address_controller.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';
import 'package:zevoyi/model/address/address_screen_enum_model.dart';
import 'package:zevoyi/utils/loading_widget.dart';
import 'package:zevoyi/view/address/widgets/address_container.dart';

import '../../helper/sizedboxes/app_sizedboxes.dart';
import '../../model/order_summary/order_summary_screen_enum.dart';

// ignore: must_be_immutable
class AddressScreen extends StatelessWidget {
  AddressScreen({
    super.key,
    required this.screenCheck,
    this.cartId,
    this.productId,
    this.visibility = false,
  });
  final OrderSummaryScreenEnum screenCheck;
  final String? cartId;
  final String? productId;
  bool visibility;
  @override
  Widget build(BuildContext context) {
    final addressProvider =
        Provider.of<AddressProvider>(context, listen: false);
    final addAddressProvider =
        Provider.of<AddNewAddressProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await addAddressProvider.getAllAddresses().then((value) {
        if (value != null) {
          addAddressProvider
              .addressChange(addAddressProvider.addressList[0].id);
          addressProvider.addressId = addAddressProvider.addressList[0].id;
        } else {
          null;
        }
      });
    });
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(visibility == false ? 'Saved Addresses' : 'Select Address'),
        elevation: 0,
        // backgroundColor: AppColors.transparentColor,
      ),
      body: Consumer<AddNewAddressProvider>(builder: (context, values1, _) {
        return values1.loading == true
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                width: double.infinity,
                child: const Center(
                  child: LoadingWidget(),
                ),
              )
            : values1.addressList.isEmpty
                ? Column(
                    children: [
                      const Divider(thickness: 1),
                      AppSizedBoxes.sizedboxH5,
                      GestureDetector(
                        onTap: () => addressProvider.toAddNewAddressScreen(
                          context,
                          AddressScreenEnum.addAddressScreen,
                          addAddressProvider,
                        ),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          color: Colors.white,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add_sharp,
                                size: 28,
                                color: Color.fromARGB(255, 107, 33, 243),
                              ),
                              AppSizedBoxes.sizedboxW5,
                              Text(
                                'Add a new address',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 201, 33, 243),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Divider(thickness: 1),
                                AppSizedBoxes.sizedboxH5,
                                GestureDetector(
                                  onTap: () =>
                                      addressProvider.toAddNewAddressScreen(
                                    context,
                                    AddressScreenEnum.addAddressScreen,
                                    addAddressProvider,
                                  ),
                                  child: Container(
                                    height: 60,
                                    width: double.infinity,
                                    color: Color.fromARGB(49, 179, 32, 32),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.add_sharp,
                                          size: 28,
                                          color: Color.fromARGB(255, 9, 9, 9),
                                        ),
                                        AppSizedBoxes.sizedboxW5,
                                        Text(
                                          'Add a new address',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 3, 5, 6),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                AppSizedBoxes.sizedboxH12,
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return AddressContainer(
                                      name: values1.addressList[index].fullName,
                                      addressType:
                                          values1.addressList[index].title,
                                      address:
                                          "${values1.addressList[index].address}, ${values1.addressList[index].landMark}, ${values1.addressList[index].place}, ${values1.addressList[index].state}, ${values1.addressList[index].pin}",
                                      phone: values1.addressList[index].phone,
                                      addressId: values1.addressList[index].id,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(thickness: 1);
                                  },
                                  itemCount: values1.addressList.length,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      visibility == false
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () => addressProvider.toOrderSummaryScreen(
                                context,
                                screenCheck,
                                productId,
                                cartId,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 48,
                                color: Color.fromARGB(104, 243, 33, 33),
                                child: const Center(
                                    child: Text(
                                  'DELIVER HERE',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ),
                    ],
                  );
      }),
    );
  }
}
