import 'package:flutter/material.dart';

import '../../../helper/sizedboxes/app_sizedboxes.dart';

class OrderAddressWidget extends StatelessWidget {
  const OrderAddressWidget({
    super.key,
    required this.name,
    required this.number,
    required this.pin,
    required this.state,
    required this.area,
    required this.address,
  });
  final String name;
  final String number;
  final String pin;
  final String state;
  final String area;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 15),
          ),
          AppSizedBoxes.sizedboxH8,
          Text(
            address,
            style: const TextStyle(fontSize: 14),
          ),
          AppSizedBoxes.sizedboxH3,
          Text(
            area,
            style: const TextStyle(fontSize: 14),
          ),
          AppSizedBoxes.sizedboxH3,
          Text(
            '${state.trim()}-$pin',
            style: const TextStyle(fontSize: 14),
          ),
          AppSizedBoxes.sizedboxH3,
          Text(
            'Phone number: $number',
            style: const TextStyle(fontSize: 14),
          ),
          AppSizedBoxes.sizedboxH3,
        ],
      ),
    );
  }
}
