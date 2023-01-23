import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:zevoyi/model/home_models/product_model.dart';
import 'package:zevoyi/view/product_screen/products_collection_screen.dart';
import 'package:zevoyi/view/product_screen/widgets/custom_bottom_container.dart';
import 'package:zevoyi/view/product_screen/widgets/product_description.dart';
import 'package:zevoyi/view/product_screen/widgets/product_images_carousal_view.dart';

import '../../controller/provider/cart/cart_controller.dart';
import '../../controller/provider/home/home_screen_controller.dart';
import '../../controller/provider/product_screen/product_screen_controller.dart';
import '../../controller/provider/wishlist/wishlist_controller.dart';
import '../../helper/colors/app_colors.dart';
import '../../helper/sizedboxes/app_sizedboxes.dart';
import '../../model/order_summary/order_summary_screen_enum.dart';
import '../../utils/loading_widget.dart';

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({
    super.key,
    required this.productId,
    required this.categoryId,
  });
  final String productId;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    //  final productsId = ModalRoute.of(context)!.settings.arguments as String;

    final data = Provider.of<HomeScreenProvider>(context, listen: false)
        .findByName(categoryId);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    productProvider.productId = productId;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartProvider.getCartItems();
      productProvider.getAProduct();
    });
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leadingWidth: 35,
        title: const Icon(
          Icons.line_axis,
          size: 30,
          color: Color.fromARGB(255, 220, 93, 93),
        ),
        // elevation: 0,
        // backgroundColor: AppColors.transparentColor,
      ),
      body: Consumer3<ProductProvider, WishListProvider, CartProvider>(
        builder: (context, values, values2, values3, _) {
          final product = values.product;
          return values.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                )
              : Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 9, top: 8),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () =>
                                          values2.addOrRemoveFromWishList(
                                              productProvider.productId
                                                  .toString()),
                                      child: Card(
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(values2.icon)
                                            // Icon(
                                            //   values2.favouriteProducts.contains(
                                            //           values.product!.id)
                                            //       ? Icons.favorite
                                            //       : Icons
                                            //           .favorite_outline_outlined,
                                            //   color: values2.favouriteProducts
                                            //           .contains(
                                            //               values.product!.id)
                                            //       ? AppColors.redColor
                                            //       : AppColors.blackcolor,
                                            //   size: 30,
                                            // ),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                ImageCarousalsWidget(
                                  images: product!.image,
                                ),
                              ],
                            ),
                          ),
                          AppSizedBoxes.sizedboxH12,
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                ProductCollectionScreen.routeName,
                                arguments: product.category,
                              );
                            },
                            child: Text(
                              'View more from ${data.name}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.blue),
                            ),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductDescription(
                                  productName: product.name,
                                  rating: product.rating,
                                  linethroughPrice: '₹${product.price}',
                                  currentPrice:
                                      '₹${(product.price - product.discountPrice).round()}',
                                  offer: '${product.offer}% off',
                                  fee: product.deliveryFee,
                                ),
                                const Text(
                                  'Highlights',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                kbox10,
                                ProductsDetails(
                                  detailes: 'RAM :',
                                  title: '${product.details.ram} GB',
                                ),
                                ProductsDetails(
                                  title: '${product.details.frontCam}',
                                  detailes: 'FrontCam :',
                                ),
                                ProductsDetails(
                                  title: '${product.details.rearCam}',
                                  detailes: 'RearCam :',
                                ),
                                ProductsDetails(
                                  detailes: 'Display Type :',
                                  title: '${product.details.display}',
                                ),
                                ProductsDetails(
                                  title: '${product.details.processor}',
                                  detailes: 'Processor :',
                                ),
                                ProductsDetails(
                                  title: '${product.details.battery}',
                                  detailes: 'Battery :',
                                ),
                                ProductsDetails(
                                  title: product.description,
                                  detailes: 'Description :',
                                ),
                              ]),
                          kbox20,
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 50,
                        // width: double.infinity,
                        child: Row(
                          children: [
                            CustomBottomContainer(
                              containerColor: Color.fromARGB(255, 246, 100, 87),
                              text: values3.cartItemsId
                                      .contains(values.product!.id)
                                  ? 'Go to cart'
                                  : 'Add to cart',
                              ontap: () => values3.cartItemsId
                                      .contains(values.product!.id)
                                  ? values.goToCart(context)
                                  : values3.addToCart(
                                      values.product!.id.toString(),
                                      // values.productSize,
                                      null),
                            ),
                            CustomBottomContainer(
                              containerColor: Color.fromARGB(255, 68, 130, 255),
                              text: 'Buy now',
                              ontap: () async {
                                values3.cartItemsId.contains(values.product!.id)
                                    ? values.toAddressScreen(
                                        context,
                                        OrderSummaryScreenEnum
                                            .buyOneProductOrderSummaryScreen,
                                        values3.cartList!.id,
                                        product.id)
                                    : values3
                                        .addToCart(
                                            values.product!.id.toString(),
                                            // values.productSize,
                                            OrderSummaryScreenEnum
                                                .buyOneProductOrderSummaryScreen)
                                        .then((value) {
                                        values.toAddressScreen(
                                            context,
                                            OrderSummaryScreenEnum
                                                .buyOneProductOrderSummaryScreen,
                                            values3.cartList!.id,
                                            product.id);
                                      });
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({
    Key? key,
    required this.title,
    required this.detailes,
  }) : super(key: key);
  final String title;
  final String detailes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailes,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 132, 131, 131),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
