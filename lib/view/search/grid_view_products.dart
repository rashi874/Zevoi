import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/core/api/api_baseurl.dart';
import 'package:zevoyi/view/product_screen/widgets/utils/product_description_style2.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';
import '../../controller/provider/home/home_screen_controller.dart';
import '../../controller/provider/wishlist/wishlist_controller.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({
    super.key,
    this.physics,
  });
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    final wishListProvider =
        Provider.of<WishListProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      wishListProvider.getWishListItems();
    });
    return Consumer2<HomeScreenProvider, WishListProvider>(
        builder: (context, values, values2, _) {
      return GridView.builder(
        physics: physics,
        shrinkWrap: true,
        itemCount: values.productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: 1.26 / 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => values.toProductScreen(context,
                values.productList[index].id, values.carousalList[index].id),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            height: 130,
                            width: 150,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "http://${ApiUrl.url}:5005/products/${values.productList[index].image[0]}",
                            ),
                          ),
                          AppSizedBoxes.sizedboxH5,
                          Text(values.productList[index].name),
                          AppSizedBoxes.sizedboxH3,
                          const Spacer(),
                          ProductDescriptionStyleTwo(
                            text1:
                                '₹${values.productList[index].discountPrice}',
                            text2: '₹${values.productList[index].price}',
                            text3: '${values.productList[index].offer}% off',
                            fontsize: 12,
                            fonsize2: 10,
                          ),
                          AppSizedBoxes.sizedboxH5,
                          Container(
                            width: 45,
                            color: AppColors.greenColor,
                            child: Row(
                              children: [
                                AppSizedBoxes.sizedboxW5,
                                Text(
                                  values.productList[index].rating.toString(),
                                  style: const TextStyle(
                                      color: AppColors.whiteColor),
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.whiteColor,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 9, top: 8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => values2.addOrRemoveFromWishList(
                          values.productList[index].id.toString()),
                      child: Icon(
                        values2.favouriteProducts
                                .contains(values.productList[index].id)
                            ? Icons.favorite
                            : Icons.favorite_outline_outlined,
                        color: values2.favouriteProducts
                                .contains(values.productList[index].id)
                            ? AppColors.redColor
                            : AppColors.blackcolor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
