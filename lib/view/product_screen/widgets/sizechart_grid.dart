// import 'package:e_commerce_app/controller/cart/cart_controller.dart';
// import 'package:e_commerce_app/controller/product_screen/product_screen_controller.dart';
// import 'package:e_commerce_app/helper/colors/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SizeChartGridView extends StatelessWidget {
//   const SizeChartGridView({
//     super.key,
//     required this.sizeList,
//   });
//   final List<String> sizeList;
//   @override
//   Widget build(BuildContext context) {
//     return Consumer2<ProductProvider, CartProvider>(
//       builder: (context, values, values2, _) {
//         return GridView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: sizeList.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 20,
//             childAspectRatio: 1 / 0.5,
//           ),
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () => values.sizeSelect(index),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.transparentColor,
//                   border: Border.all(
//                     color: values.sizeChartIndex == index
//                         ? AppColors.blueColor
//                         : AppColors.whiteColor54,
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(sizeList[index]),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
