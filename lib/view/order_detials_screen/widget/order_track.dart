import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/order_details/order_detials_controller.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';

import '../../../helper/sizedboxes/app_sizedboxes.dart';

class OrderTrackWidget extends StatelessWidget {
  const OrderTrackWidget({
    super.key,
    required this.orderedDate,
    required this.deliveredDate,
    this.shippedDate,
    this.canceledDate,
  });
  final String orderedDate;
  final String? shippedDate;
  final String deliveredDate;
  final String? canceledDate;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, values, _) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: values.orderModel!.orderStatus == 'CANCELED'
              ? Row(
                  children: [
                    SizedBox(
                      height: 250,
                      width: 55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const CircleAvatar(
                            backgroundColor: AppColors.greenColor,
                            radius: 10,
                            child: Icon(
                              Icons.check,
                              size: 14,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          AppSizedBoxes.sizedboxH3,
                          Container(
                            height: 52,
                            width: 2,
                            color: AppColors.whiteColor54,
                          ),
                          AppSizedBoxes.sizedboxH3,
                          const CircleAvatar(
                            backgroundColor: AppColors.redColor,
                            radius: 10,
                            child: Icon(
                              Icons.cancel,
                              size: 14,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSizedBoxes.sizedboxW15,
                    SizedBox(
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Order confirmed'),
                              Text(orderedDate,
                                  style: const TextStyle(fontSize: 12))
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Order Canceled'),
                              Text(
                                canceledDate ?? '12',
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    SizedBox(
                      height: 250,
                      width: 55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const CircleAvatar(
                            backgroundColor: AppColors.greenColor,
                            radius: 10,
                            child: Icon(
                              Icons.check,
                              size: 14,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          AppSizedBoxes.sizedboxH3,
                          Container(
                            height: 52,
                            width: 2,
                            color: AppColors.whiteColor54,
                          ),
                          AppSizedBoxes.sizedboxH3,
                          CircleAvatar(
                            backgroundColor:
                                values.orderModel!.orderStatus == 'shipped' ||
                                        values.orderModel!.orderStatus ==
                                            'delivered'
                                    ? AppColors.greenColor
                                    : AppColors.whiteColor54,
                            radius: 10,
                            child: const Icon(
                              Icons.check,
                              size: 14,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          AppSizedBoxes.sizedboxH3,
                          Container(
                            height: 54,
                            width: 2,
                            color: AppColors.whiteColor54,
                          ),
                          AppSizedBoxes.sizedboxH3,
                          CircleAvatar(
                            backgroundColor:
                                values.orderModel!.orderStatus == 'delivered'
                                    ? AppColors.greenColor
                                    : AppColors.whiteColor54,
                            radius: 10,
                            child: const Icon(
                              Icons.check,
                              size: 14,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSizedBoxes.sizedboxW15,
                    SizedBox(
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Order confirmed'),
                              Text(orderedDate,
                                  style: const TextStyle(fontSize: 12))
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order Shipped',
                                style: values.orderModel!.orderStatus ==
                                            'shipped' ||
                                        values.orderModel!.orderStatus ==
                                            'delivered'
                                    ? const TextStyle()
                                    : const TextStyle(
                                        color: AppColors.whiteColor38),
                              ),
                              Text(
                                  values.orderModel!.orderStatus == 'shipped' ||
                                          values.orderModel!.orderStatus ==
                                              'delivered'
                                      ? shippedDate!
                                      : '',
                                  style: values.orderModel!.orderStatus ==
                                              'shipped' ||
                                          values.orderModel!.orderStatus ==
                                              'delivered'
                                      ? const TextStyle(fontSize: 12)
                                      : const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.whiteColor38))
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order Delivered',
                                  style: values.orderModel!.orderStatus ==
                                          'delivered'
                                      ? const TextStyle()
                                      : const TextStyle(
                                          color: AppColors.whiteColor38)),
                              Text(
                                values.orderModel!.orderStatus == 'delivered'
                                    ? deliveredDate
                                    : '',
                                style: values.orderModel!.orderStatus ==
                                            'shipped' ||
                                        values.orderModel!.orderStatus ==
                                            'delivered'
                                    ? const TextStyle(fontSize: 12)
                                    : const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.whiteColor38),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
