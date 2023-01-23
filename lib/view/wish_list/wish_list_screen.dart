import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';
import '../../controller/provider/cart/cart_controller.dart';
import '../../controller/provider/home/home_screen_controller.dart';
import '../../controller/provider/wishlist/wishlist_controller.dart';
import '../../helper/colors/app_colors.dart';
import '../../helper/sizedboxes/app_sizedboxes.dart';
import '../../utils/loading_widget.dart';
import '../product_screen/widgets/product_textdescription_style.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final wishListProvider =
    //     Provider.of<WishListProvider>(context, listen: false);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   wishListProvider.getWishListItems();
    // }
    // );
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
          title: const Text(
            'My WishList',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Column(
          children: [
            Consumer3<WishListProvider, HomeScreenProvider, CartProvider>(
              builder: (context, wishListValues, homeValues, cartValues, _) {
                return wishListValues.loading == true
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: const Center(
                          child: LoadingWidget(),
                        ),
                      )
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
                        : Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    wishListValues.wishList!.products.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 1.5 / 2,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => homeValues.toProductScreen(
                                      context,
                                      wishListValues
                                          .wishList!.products[index].product.id,
                                      wishListValues.wishList!.products[index]
                                          .product.category,
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.black26,
                                            border: Border.all(
                                              color: AppColors.whiteColor54,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12.0, horizontal: 8),
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image(
                                                    height: 130,
                                                    width: 180,
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        "http://${ApiUrl.url}:5008/products/${wishListValues.wishList!.products[index].product.image[0]}"),
                                                  ),
                                                  AppSizedBoxes.sizedboxH15,
                                                  Text(
                                                    wishListValues
                                                        .wishList!
                                                        .products[index]
                                                        .product
                                                        .name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  AppSizedBoxes.sizedboxH3,
                                                  ProductTextdesciptionStyle(
                                                    text1:
                                                        "₹${wishListValues.wishList!.products[index].product.discountPrice}",
                                                    text2:
                                                        '₹${wishListValues.wishList!.products[index].product.price}',
                                                    text3:
                                                        '${wishListValues.wishList!.products[index].product.offer}% off',
                                                  ),
                                                  AppSizedBoxes.sizedboxH5,
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 9, top: 10),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
              },
            )
          ],
        ),
      ),
    );
  }
}
