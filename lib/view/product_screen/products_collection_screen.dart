import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/view/product_screen/widgets/utils/product_description_style2.dart';
import '../../../utils/loading_widget.dart';
import '../../controller/provider/home/home_screen_controller.dart';
import '../../controller/provider/wishlist/wishlist_controller.dart';
import '../../core/api/api_baseurl.dart';

class ProductCollectionScreen extends StatelessWidget {
  const ProductCollectionScreen({
    super.key,
    // this.category,
    // this.categoryId,
  });
  // final String category;
  // final String categoryId;

  // static const routeName = "/list_view_products.dart";
  static const routeName = "/products_collection_screen.dart";
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final provider = Provider.of<HomeScreenProvider>(context, listen: false)
        .findByCategoryId(productId);
    final data = Provider.of<HomeScreenProvider>(context, listen: false)
        .findByName(productId);
    final wishListProvider =
        Provider.of<WishListProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      wishListProvider.getWishListItems();
    });
    // final homeProvider =
    //     Provider.of<HomeScreenProvider>(context, listen: false);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   homeProvider.getProductsByCategory(categoryId);
    // });
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        // backgroundColor: AppColors.transparentColor,
        elevation: 0,
        title: Text(data.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Consumer<HomeScreenProvider>(builder: (context, values, _) {
        return values.loading == true
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                width: double.infinity,
                child: const Center(
                  child: LoadingWidget(),
                ),
              )
            : Consumer2<HomeScreenProvider, WishListProvider>(
                builder: (context, values, values2, _) {
                return ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => values.toProductScreen(
                          context,
                          values.productList[index].id,
                          values.categoryList[3].id),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                        'http://${ApiUrl.url}:5005/products/${provider[index].image[0]}')),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 240,
                                    height: 45,
                                    child: Text(
                                      provider[index].name.toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  ProductDescriptionStyleTwo(
                                    text1: '₹${provider[index].price}',
                                    text2:
                                        '₹${(provider[index].price - provider[index].discountPrice).round()}',
                                    text3: '${provider[index].offer}% off',
                                    fonsize2: 16, fontsize: 16,
                                    // rating: values.productList[index].rating.toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Color.fromARGB(26, 9, 9, 9),
                          ),
                        ],
                      ),
                    );
                  },
                );
              });
      }),
    );
  }
}
