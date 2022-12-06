import 'package:expense_tracker/common_widgets/image_container.dart';
import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/common_utils.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TransactionModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageContainerWidget(
          imagePath: CommonUtils.getImageFromAsset("paypal"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              data.timeStamp,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            )
          ],
        ).paddingForOnly(left: 10).expanded(flex: 1),
        Text(
          (data.isDebited ? "-" : "+") + data.amount.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: data.isDebited
                ? CustomColors.debitedColor
                : CustomColors.creditedColor,
          ),
        )
      ],
    ).paddingWithSymmetry(horizontal: 22);
  }
}
