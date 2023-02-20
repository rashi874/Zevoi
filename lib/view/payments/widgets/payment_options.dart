import 'package:flutter/material.dart';
import 'package:zevoyi/controller/provider/payments/payments_controller.dart';

import '../../../helper/sizedboxes/app_sizedboxes.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({
    super.key,
    required this.paymentProvider,
  });
  final PaymentProvider paymentProvider;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio(
              value: paymentProvider.onlinePayment,
              groupValue: paymentProvider.paymentType,
              onChanged: (value) => paymentProvider.paymentSelection(value),
            ),
            AppSizedBoxes.sizedboxW5,
            const Text('Online Payment'),
          ],
        ),
        AppSizedBoxes.sizedboxH15,
        Row(
          children: [
            Radio(
              value: paymentProvider.cashOnDelivery,
              groupValue: paymentProvider.paymentType,
              onChanged: (value) => paymentProvider.paymentSelection(value),
            ),
            AppSizedBoxes.sizedboxW5,
            const Text('Cash On Delivery'),
          ],
        ),
      ],
    );
  }
}
