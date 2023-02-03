import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/wishlist/wishlist_controller.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zevoyi/view/home/widget/carousal_slider.dart';
import 'package:zevoyi/view/home/widget/shimmer_container.dart';
import '../../controller/provider/home/home_screen_controller.dart';
import '../../core/api/api_baseurl.dart';
import '../../helper/colors/app_colors.dart';
import '../../helper/sizedboxes/app_sizedboxes.dart';
import 'package:flutter/cupertino.dart';
import '../product_screen/products_collection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
  // final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeScreenProvider>(context, listen: false).getProducts();
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        automaticallyImplyLeading: false,
        // backgroundColor: colors.background,
        elevation: 0,
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            children: [
              const Icon(
                Icons.line_axis,
                size: 55,
                color: Color.fromARGB(255, 3, 17, 47),
              ),
              Text(
                'Zevoi',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              size: 23,
              // color: Color.fromARGB(255, 0, 0, 0),
            ),
            style: IconButton.styleFrom(
              foregroundColor: colors.onPrimary,
              backgroundColor: colors.primary,
              disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
              hoverColor: colors.onPrimary.withOpacity(0.08),
              focusColor: colors.onPrimary.withOpacity(0.12),
              highlightColor: colors.onPrimary.withOpacity(0.12),
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SafeArea(
        child: Consumer<HomeScreenProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        value.carousalList.isEmpty
                            ? Shimmer.fromColors(
                                baseColor: const Color.fromARGB(36, 51, 51, 51),
                                highlightColor:
                                    const Color.fromARGB(55, 110, 109, 109),
                                direction: ShimmerDirection.btt,
                                child: const ShimmerContainer(
                                  margin: EdgeInsets.all(5),
                                  height: 150,
                                  width: double.infinity,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ))
                            : CarousalSliderWidget(
                                carousals: value.carousalList,
                              ),
                        // kbox10,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Top Brands',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            // color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              value.categoryList.isEmpty
                                  ? Shimmer.fromColors(
                                      baseColor:
                                          const Color.fromARGB(36, 51, 51, 51),
                                      highlightColor: const Color.fromARGB(
                                          55, 110, 109, 109),
                                      direction: ShimmerDirection.btt,
                                      child: SizedBox(
                                        height: 100,
                                        child: ListView.builder(
                                          itemCount: 6,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  ShimmerContainer(
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    height: 60,
                                                    width: 60,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  kbox10,
                                                  const ShimmerContainer(
                                                    margin: EdgeInsets.all(0),
                                                    height: 10,
                                                    width: 50,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(2),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : Container(
                                      // color: const Color.fromARGB(
                                      //     255, 243, 248, 255),
                                      height: 120,
                                      child: ListView.builder(
                                          itemCount: value.categoryList.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              child: Column(
                                                children: [
                                                  kbox10,
                                                  GestureDetector(
                                                    onTap: () =>
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                      ProductCollectionScreen
                                                          .routeName,
                                                      arguments: value
                                                          .categoryList[index]
                                                          .id,
                                                    ),
                                                    // value
                                                    //     .toCollectionScreen(
                                                    //   context,
                                                    //   value.categoryList[index]
                                                    //       .name,
                                                    //   value.categoryList[index]
                                                    //       .id,
                                                    // ),
                                                    child: Container(
                                                      height: 55,
                                                      width: 55,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          image:
                                                              DecorationImage(
                                                                  image:
                                                                      NetworkImage(
                                                                    "http://${ApiUrl.url}:5005/category/${value.categoryList[index].imagePath}",
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover)),
                                                    ),
                                                  ),
                                                  kbox10,
                                                  Text(
                                                    value.categoryList[index]
                                                        .name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    kbox10,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Text(
                        'Latest Products',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    kbox10,
                    value.productList.isEmpty == true
                        ? Shimmer.fromColors(
                            baseColor: const Color.fromARGB(56, 51, 51, 51),
                            highlightColor:
                                const Color.fromARGB(55, 110, 109, 109),
                            child: GridView.builder(
                                padding: const EdgeInsets.all(10),
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 10,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        childAspectRatio: 1 / 1.4),
                                itemBuilder: (BuildContext context, int index) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        ShimmerContainer(
                                          margin: EdgeInsets.all(0),
                                          height: 200,
                                          width: double.infinity,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        kbox10,
                                        ShimmerContainer(
                                          margin: EdgeInsets.all(0),
                                          height: 8,
                                          width: 150,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(2),
                                          ),
                                        ),
                                        kbox10,
                                        ShimmerContainer(
                                          margin: EdgeInsets.all(0),
                                          height: 8,
                                          width: 100,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(2),
                                          ),
                                        ),
                                        kbox10,
                                        ShimmerContainer(
                                          margin: EdgeInsets.all(0),
                                          height: 8,
                                          width: 60,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }))
                        : Consumer2<HomeScreenProvider, WishListProvider>(
                            builder: (context, values, values2, _) {
                            return GridView.builder(
                                padding: const EdgeInsets.all(4),
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: value.productList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 15,
                                        childAspectRatio: 1.0 / 1.3),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () => values.toProductScreen(
                                        context,
                                        values.productList[index].id,
                                        values.productList[index].category),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          kbox20,
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            height: 120,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "http://${ApiUrl.url}:5005/products/${value.productList[index].image[0]}"),
                                                    fit: BoxFit.fitHeight),
                                                // color:
                                                //     Color.fromARGB(255, 54, 200, 244),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          kbox10,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  value.productList[index].name,
                                                  // textWidthBasis:
                                                  //     TextWidthBasis.longestLine,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  // style: const TextStyle(
                                                  //     fontSize: 13,
                                                  //     fontWeight:
                                                  //         FontWeight.bold,
                                                  //     color: Color.fromARGB(
                                                  //         255, 2, 2, 2)),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "₹ ${(value.productList[index].price - value.productList[index].discountPrice).round()}.00",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          // fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  textAlign: TextAlign.center,
                                                ),
                                                kboxw20,
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(8),
                                                width: 40,
                                                height: 20,
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 24, 97, 186),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    AppSizedBoxes.sizedboxW5,
                                                    Text(
                                                      value.productList[index]
                                                          .rating
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    const Icon(
                                                      Icons.star,
                                                      size: 12,
                                                      color:
                                                          AppColors.whiteColor,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "₹ ${(value.productList[index].price)}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                // style: const TextStyle(
                                                //     fontSize: 13,
                                                //     decoration: TextDecoration
                                                //         .lineThrough,
                                                //     color: Color.fromARGB(
                                                //         255, 182, 182, 182)),
                                              ),
                                              kboxw5,
                                              Text(
                                                '${value.productList[index].offer}% off',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),
                    // value.carousalList.isEmpty
                    //     ? Shimmer.fromColors(
                    //         baseColor: const Color.fromARGB(36, 51, 51, 51),
                    //         highlightColor:
                    //             const Color.fromARGB(55, 110, 109, 109),
                    //         direction: ShimmerDirection.btt,
                    //         child: const ShimmerContainer(
                    //           height: 150,
                    //           width: double.infinity,
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(5),
                    //           ),
                    //           margin: EdgeInsets.all(5),
                    //         ))
                    //     : Padding(
                    //         padding: const EdgeInsets.all(5.0),
                    //         child: Container(
                    //           height: 150,
                    //           // width: 500,
                    //           decoration: const BoxDecoration(
                    //               image: DecorationImage(
                    //                   image: NetworkImage(
                    //                       'https://cdn.shopify.com/s/files/1/0544/7319/5695/files/Banner_quick_delivery_what_a_host-2_x800.jpg?v=1669590946'),
                    //                   fit: BoxFit.fitWidth)),
                    //         ),
                    //       ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
