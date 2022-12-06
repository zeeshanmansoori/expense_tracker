import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';

class ActionFab extends StatelessWidget {
  const ActionFab({
    Key? key,
    required this.iconData,
    required this.fabClicked,
    required this.title,
  }) : super(key: key);

  final IconData iconData;
  final void Function() fabClicked;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: fabClicked,
          shape: const StadiumBorder(
            side: BorderSide(
              color: CustomColors.primaryColor,
              width: 1,
            ),
          ),
          elevation: 0,
          hoverElevation: 0,
          child: Icon(
            iconData,
            color: CustomColors.primaryColor,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: CustomColors.neroTextColor,
          ),
        ).paddingForOnly(top: 5)
      ],
    );
  }
}
