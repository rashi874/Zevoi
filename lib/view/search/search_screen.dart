import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/home/home_screen_controller.dart';
import 'package:zevoyi/helper/colors/app_colors.dart';
import 'package:zevoyi/view/search/grid_view_products.dart';

import '../../helper/sizedboxes/app_sizedboxes.dart';
import '../../utils/loading_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppSizedBoxes.sizedboxH8,
                CupertinoSearchTextField(
                  autofocus: true,
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  style: const TextStyle(color: AppColors.whiteColor),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: Colors.grey,
                  ),
                  onChanged: ((value) => {
                        homeProvider.debouncer.run(() {
                          homeProvider.searchProducts(value);
                        })
                      }),
                ),
                AppSizedBoxes.sizedboxH15,
                Consumer<HomeScreenProvider>(
                  builder: (context, values, _) {
                    return values.loading == true
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 1.3,
                            width: double.infinity,
                            child: const Center(
                              child: LoadingWidget(),
                            ),
                          )
                        : values.productList.isEmpty
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.3,
                                width: double.infinity,
                                child: const Center(
                                  child: Text('No prouducts found'),
                                ),
                              )
                            : const GridViewProducts(
                                physics: NeverScrollableScrollPhysics(),
                              );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
