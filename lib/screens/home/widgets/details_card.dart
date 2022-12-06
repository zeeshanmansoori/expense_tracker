import 'package:expense_tracker/common_widgets/text_with_trailing_icon.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/expense_tracker_icons.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 30,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: CustomColors.darkGreenShadowColor,
              blurRadius: 50,
            )
          ]),
        ).paddingWithSymmetry(horizontal: 20),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          color: CustomColors.primaryColorDark,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWithTrailingIcon(
                        text: "Total Balance",
                        icon: Icon(
                          ExpenseTrackerIcons.chevronUp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "\$ 2,548.00",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ).paddingForOnly(top: 8)
                    ],
                  ).expanded(flex: 1),
                  const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ).paddingForOnly(top: 15)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ExpenseWidget(
                    iconData: ExpenseTrackerIcons.arrowDown,
                    title: "Income",
                    data: "\$ 1,840.00",
                    alignment: CrossAxisAlignment.start,
                  ),
                  ExpenseWidget(
                    iconData: ExpenseTrackerIcons.arrowUp,
                    title: "Expenses",
                    data: "\$ 200.00",
                    alignment: CrossAxisAlignment.end,
                  ),
                ],
              ).paddingForOnly(top: 30)
            ],
          ).paddingForAll(20),
        )
      ],
    );
  }
}

class ExpenseWidget extends StatelessWidget {
  const ExpenseWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.data,
    required this.alignment,
  });

  final IconData iconData;
  final String title;
  final String data;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.15),
              ),
              child: Icon(
                iconData,
                size: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: const TextStyle(
                color: CustomColors.lightGreenTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            )
          ],
        ),
        Text(
          "\$ 1,840.00",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        ).paddingForOnly(top: 7)
      ],
    );
  }
}
