import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/expense_tracker_icons.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';

class BellIcon extends StatelessWidget {
  const BellIcon({
    Key? key,
    required this.onBellClicked,
  }) : super(key: key);
  final void Function() onBellClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBellClicked,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.06),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            )),
        child: Stack(
          children: [
            const Icon(
              ExpenseTrackerIcons.notification,
              color: Colors.white,
            ),
            Positioned(
              right: 1,
              top: 1,
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: CustomColors.notificationDotColor,
                ),
              ),
            ),
          ],
        ).paddingForAll(8),
      ),
    );
  }
}
