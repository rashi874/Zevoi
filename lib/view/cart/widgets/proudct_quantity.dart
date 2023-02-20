import 'package:flutter/material.dart';
import '../../../helper/colors/app_colors.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({
    super.key,
    required this.ontap1,
    required this.ontap2,
    required this.quantity,
  });
  final void Function() ontap1;
  final void Function() ontap2;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // width: 120,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 181, 192, 129),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: AppColors.blackcolor,
            onPressed: ontap1,
            icon: const Icon(Icons.remove),
          ),
          FittedBox(
            child: Text(
              '$quantity',
              style: const TextStyle(
                color: AppColors.blackcolor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            iconSize: 25,
            splashRadius: 2,
            color: Colors.black,
            onPressed: ontap2,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
