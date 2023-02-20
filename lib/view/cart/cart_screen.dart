import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';
import 'package:zevoyi/helper/sizedboxes/app_sizedboxes.dart';
import 'package:zevoyi/utils/loading_widget.dart';
import 'package:zevoyi/view/cart/widgets/cart_product.dart';
import 'package:zevoyi/view/cart/widgets/custom_bottom_placeorderwidget.dart';
import 'package:zevoyi/view/cart/widgets/custom_cart_button.dart';
import 'package:zevoyi/view/cart/widgets/price_details_widget.dart';
import 'package:zevoyi/view/home/widget/shimmer_container.dart';

import '../../controller/provider/cart/cart_controller.dart';
import '../../model/order_summary/order_summary_screen_enum.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartScreenProvider =
        Provider.of<CartProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartScreenProvider.getCartItems();
    });
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: Text(
            'My Cart',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
        ),
        body: Consumer<CartProvider>(
          builder: (context, values, _) {
            return values.cartList == null || values.cartList!.products.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          // SizedBox(height: 130),
                          Image(
                            image: AssetImage('assets/images/splash8.jpg'),
                            height: 100,
                          ),
                          kbox10,
                          Text(
                            'Cart is empty',
                            style: TextStyle(color: AppColors.blackcolor),
                          )
                        ],
                      ),
                    ),
                  )
                : values.loading == true
                    ? ListView.builder(
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                              baseColor: const Color.fromARGB(36, 51, 51, 51),
                              highlightColor:
                                  const Color.fromARGB(130, 110, 109, 109),
                              direction: ShimmerDirection.ltr,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const ShimmerContainer(
                                    margin: EdgeInsets.all(5),
                                    height: 120,
                                    width: 80,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const ShimmerContainer(
                                        margin: EdgeInsets.all(5),
                                        height: 10,
                                        width: 270,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          ShimmerContainer(
                                            margin: EdgeInsets.all(5),
                                            height: 10,
                                            width: 100,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          ShimmerContainer(
                                            margin: EdgeInsets.all(5),
                                            height: 10,
                                            width: 100,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          // const ShimmerContainer(
                                          //   margin: EdgeInsets.all(5),
                                          //   height: 10,
                                          //   width: 100,
                                          //   borderRadius: BorderRadius.all(
                                          //     Radius.circular(5),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      const ShimmerContainer(
                                        margin: EdgeInsets.all(5),
                                        height: 10,
                                        width: 200,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ));
                        })
                    : Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 7),
                              child: Column(
                                children: [
                                  // const Divider(thickness: 4),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              CartProducts(
                                                image: values
                                                    .cartList!
                                                    .products[index]
                                                    .product
                                                    .image[0],
                                                proudctName: values
                                                    .cartList!
                                                    .products[index]
                                                    .product
                                                    .name,
                                                size: values.cartList!
                                                    .products[index].size,
                                                prouductPrice: values.cartList!
                                                    .products[index].price,
                                                linethroughPrice: values
                                                    .cartList!
                                                    .products[index]
                                                    .discountPrice,
                                                offer: values
                                                    .cartList!
                                                    .products[index]
                                                    .product
                                                    .offer
                                                    .toString(),
                                                ontap1: () => values
                                                    .incrementOrDecrementQuantity(
                                                  -1,
                                                  values
                                                      .cartList!
                                                      .products[index]
                                                      .product
                                                      .id,
                                                  values.cartList!
                                                      .products[index].size,
                                                  values.cartList!
                                                      .products[index].qty,
                                                ),
                                                ontap2: () => values
                                                    .incrementOrDecrementQuantity(
                                                  1,
                                                  values
                                                      .cartList!
                                                      .products[index]
                                                      .product
                                                      .id,
                                                  values.cartList!
                                                      .products[index].size,
                                                  values.cartList!
                                                      .products[index].qty,
                                                ),
                                                quantity: values.cartList!
                                                    .products[index].qty,
                                              ),
                                              // AppSizedBoxes.sizedboxH8,
                                              // // const Divider(thickness: 1),
                                              // AppSizedBoxes.sizedboxH5,
                                              Row(
                                                children: const [
                                                  Text(
                                                      'Delivery by Tue Nov 15 |'),
                                                  AppSizedBoxes.sizedboxW3,
                                                  Text(
                                                    'Free',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .greenColor),
                                                  ),
                                                ],
                                              ),
                                              AppSizedBoxes.sizedboxH8,
                                              // const Divider(thickness: 1),
                                              AppSizedBoxes.sizedboxH5,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomCartButton(
                                                    text: 'Remove',
                                                    onTap: () => values
                                                        .removeFromCart(values
                                                            .cartList!
                                                            .products[index]
                                                            .product
                                                            .id),
                                                    color: AppColors.redColor,
                                                    icon: Icons
                                                        .delete_forever_sharp,
                                                  ),
                                                  AppSizedBoxes.sizedboxW15,
                                                  CustomCartButton(
                                                    text: 'Buy now',
                                                    onTap: () =>
                                                        values.toAddressScreen(
                                                      context,
                                                      OrderSummaryScreenEnum
                                                          .buyOneProductOrderSummaryScreen,
                                                      values.cartList!.id,
                                                      values
                                                          .cartList!
                                                          .products[index]
                                                          .product
                                                          .id,
                                                    ),
                                                    color: AppColors.blueColor,
                                                    icon: Icons.shopify,
                                                  ),
                                                ],
                                              ),
                                              AppSizedBoxes.sizedboxH12,
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: values.cartList!.products.length,
                                  ),
                                  // AppSizedBoxes.sizedboxH12,
                                  // const Divider(thickness: 4),
                                  // AppSizedBoxes.sizedboxH12,
                                  PriceDetailsWidget(
                                    itemCount:
                                        values.totalProductCount.toString(),
                                    amount: values.cartList!.totalDiscount
                                        .toString(),
                                    discount: values.totalSave.toString(),
                                    deliveryCharge: 'Free',
                                    totalAmount:
                                        values.cartList!.totalPrice.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomBottomPlaceOrderWidget(
                              ontap: () => cartScreenProvider.toAddressScreen(
                                context,
                                OrderSummaryScreenEnum.normalOrderSummaryScreen,
                                null,
                                null,
                              ),
                              totalAmount:
                                  values.cartList!.totalPrice.toString(),
                            ),
                          ),
                        ],
                      );
          },
        ),
      ),
    );
  }
}
