import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/order_controller/myorder_controller.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';
import 'package:zevoyi/helper/sizedboxes/app_sizedboxes.dart';

import '../../utils/loading_widget.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myOrderProvider =
        Provider.of<MyOrdersProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      myOrderProvider.getAllOrders();
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('My Orders'),
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
        ),
        body: Consumer<MyOrdersProvider>(builder: (context, values, _) {
          return values.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                )
              : values.ordersList == null || values.ordersList!.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: double.infinity,
                      child: Column(
                        children: const [
                          SizedBox(height: 160),
                          Image(
                              image: AssetImage(
                                  'assets/cart&wishlist&orders assets/emptyOrder.png')),
                          Text(
                            'No orders yet',
                            style: TextStyle(color: AppColors.whiteColor54),
                          )
                        ],
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index1) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index2) {
                                  final deliveryDate = values.formatDate(values
                                      .ordersList![index1].deliveryDate
                                      .toString());
                                  final canceledDate = values.formatCancelDate(
                                      values.ordersList![index1].cancelDate
                                          .toString());
                                  return Column(
                                    children: [
                                      AppSizedBoxes.sizedboxH12,
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Image(
                                              image: NetworkImage(
                                                  'http://${ApiUrl.url}:5005/products/${values.ordersList![index1].products[index2].product.image[0]}'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          AppSizedBoxes.sizedboxW15,
                                          SizedBox(
                                            width: 190,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(values
                                                                  .ordersList![
                                                                      index1]
                                                                  .orderStatus ==
                                                              'CANCELED'
                                                          ? 'Delivery Canceled on $canceledDate'
                                                          : values
                                                                      .ordersList![
                                                                          index1]
                                                                      .orderStatus ==
                                                                  'delivered'
                                                              ? 'Delivered on $deliveryDate'
                                                              : 'Delivery on $deliveryDate'),
                                                      AppSizedBoxes.sizedboxH8,
                                                      Text(
                                                        values
                                                            .ordersList![index1]
                                                            .products[index2]
                                                            .product
                                                            .name,
                                                        style: const TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .fade),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () => myOrderProvider
                                                .gotoOrderDetailsFromOrderScreen(
                                                    context,
                                                    values
                                                        .ordersList![index1].id,
                                                    index2),
                                            child: const Icon(Icons
                                                .keyboard_arrow_right_outlined),
                                          ),
                                        ],
                                      ),
                                      AppSizedBoxes.sizedboxH15,
                                    ],
                                  );
                                },
                                itemCount:
                                    values.ordersList![index1].products.length,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(thickness: 1);
                      },
                      itemCount: values.ordersList!.length,
                    );
        }),
      ),
    );
  }
}
