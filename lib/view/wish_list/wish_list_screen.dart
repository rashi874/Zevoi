import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';
import '../../controller/provider/cart/cart_controller.dart';
import '../../controller/provider/home/home_screen_controller.dart';
import '../../controller/provider/wishlist/wishlist_controller.dart';
import '../../helper/colors/app_colors.dart';
import '../../helper/sizedboxes/app_sizedboxes.dart';
import '../../utils/loading_widget.dart';
import '../home/widget/shimmer_container.dart';
import '../product_screen/widgets/product_textdescription_style.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishListProvider =
        Provider.of<WishListProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      wishListProvider.getWishListItems();
    });
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
          title: Text(
            'My WishList',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer3<WishListProvider, HomeScreenProvider, CartProvider>(
                builder: (context, wishListValues, homeValues, cartValues, _) {
                  return wishListValues.loading == true
                      ? ListView.builder(
                          padding: EdgeInsets.all(8),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                                baseColor: const Color.fromARGB(36, 51, 51, 51),
                                highlightColor:
                                    Color.fromARGB(130, 110, 109, 109),
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
                                          children: [
                                            const ShimmerContainer(
                                              margin: EdgeInsets.all(5),
                                              height: 10,
                                              width: 100,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            const ShimmerContainer(
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
                      : wishListValues.wishList == null ||
                              wishListValues.wishList!.products.isEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              width: double.infinity,
                              child: Column(
                                children: const [
                                  SizedBox(height: 160),
                                  Image(
                                    image:
                                        AssetImage('assets/images/splash8.jpg'),
                                    height: 100,
                                  ),
                                  Text('Your wishlist is empty'),
                                ],
                              ))
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ListView.builder(
                                padding: EdgeInsets.all(8),
                                shrinkWrap: true,
                                itemCount:
                                    wishListValues.wishList!.products.length,
                                // gridDelegate:
                                //     const SliverGridDelegateWithFixedCrossAxisCount(
                                //   crossAxisCount: 2,
                                //   mainAxisSpacing: 10,
                                //   crossAxisSpacing: 8,
                                //   childAspectRatio: 1.5 / 2,
                                // ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => homeValues.toProductScreen(
                                      context,
                                      wishListValues
                                          .wishList!.products[index].product.id,
                                      wishListValues.wishList!.products[index]
                                          .product.category,
                                    ),
                                    child: Column(
                                      children: [
                                        Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          // decoration: BoxDecoration(
                                          //   borderRadius:
                                          //       BorderRadius.circular(12),
                                          //   color: const Color.fromARGB(
                                          //       66, 255, 255, 255),
                                          //   // border: Border.all(
                                          //   //   color: const Color.fromARGB(
                                          //   //       239, 14, 14, 14),
                                          //   // ),
                                          // ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image(
                                                height: 100,
                                                // width: 180,
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "http://${ApiUrl.url}:5005/products/${wishListValues.wishList!.products[index].product.image[0]}"),
                                              ),

                                              AppSizedBoxes.sizedboxW5,

                                              ProductTextdesciptionStyle(
                                                name: wishListValues
                                                    .wishList!
                                                    .products[index]
                                                    .product
                                                    .name,
                                                text1:
                                                    "₹${(wishListValues.wishList!.products[index].product.price - wishListValues.wishList!.products[index].product.discountPrice).round()}",
                                                text2:
                                                    '₹${wishListValues.wishList!.products[index].product.price}',
                                                text3:
                                                    '${wishListValues.wishList!.products[index].product.offer}% off',
                                              ),
                                              // AppSizedBoxes.sizedboxH5,
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () => wishListValues
                                                    .addOrRemoveFromWishList(
                                                        wishListValues
                                                            .wishList!
                                                            .products[index]
                                                            .product
                                                            .id),
                                                child: const Icon(
                                                  Icons.favorite,
                                                  color: AppColors.redColor,
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
