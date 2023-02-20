import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/helper/sizedboxes/app_sizedboxes.dart';
import '../../controller/provider/order_details/order_detials_controller.dart';
import '../../helper/colors/app_colors.dart';
import '../../utils/loading_widget.dart';
import '../orders/widgets/order_address_widget.dart';
import 'widget/order_detials_product_container.dart';
import 'widget/order_track.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.orderIndex,
    required this.orderId,
  });
  final String orderId;
  final int orderIndex;
  @override
  Widget build(BuildContext context) {
    const Divider divider = Divider(thickness: 1);
    final orderDetailProvider =
        Provider.of<OrderDetailsProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orderDetailProvider.getSingleOrder(orderId);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('Order Details'),
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
        ),
        body: Consumer<OrderDetailsProvider>(builder: (context, values, _) {
          return values.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    divider,
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, top: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order ID: ${values.orderModel!.id}'),
                        ],
                      ),
                    ),
                    divider,
                    OrderDetailProductContainer(
                      image: values
                          .orderModel!.products[orderIndex].product.image[0],
                      productName:
                          values.orderModel!.products[orderIndex].product.name,
                      qty: values.orderModel!.products[orderIndex].qty
                          .toString(),
                      size: values.orderModel!.products[orderIndex].size,
                      totalAmount: values.orderModel!.products[orderIndex].price
                          .toString(),
                    ),
                    AppSizedBoxes.sizedboxH12,
                    divider,
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: OrderAddressWidget(
                        name: values.orderModel!.fullName,
                        number: values.orderModel!.phone,
                        pin: values.orderModel!.pin,
                        state: values.orderModel!.state,
                        area: values.orderModel!.address,
                        address: values.orderModel!.landMark,
                      ),
                    ),
                    divider,
                    OrderTrackWidget(
                      orderedDate: values.orderedDate!,
                      deliveredDate: values.deliveredDate!,
                      shippedDate: '2022-12-21',
                      canceledDate: values.canceledDate,
                    ),
                    divider,
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: values.orderModel!.orderStatus == 'CANCELED'
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () async {
                                await values.cancelOrder(orderId).then((value) {
                                  values.getSingleOrder(orderId);
                                });
                              },
                              child: Container(
                                color: AppColors.whiteColor38,
                                height: 40,
                                child: const Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
