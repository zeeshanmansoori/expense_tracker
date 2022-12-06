import 'package:expense_tracker/common_widgets/image_container.dart';
import 'package:expense_tracker/models/payment_app_model.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';

class PaymentAppItemWidget extends StatelessWidget {
  const PaymentAppItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final PaymentAppModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageContainerWidget(
          imagePath: data.icon,
          base64: true,
        ),
        Text("${data.appName} ${data.preferredOrder}").paddingForOnly(left: 10)
      ],
    );
  }
}
