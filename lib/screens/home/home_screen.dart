import 'package:expense_tracker/screens/bottom_navigation_screen/widgets/abstract_bottom_nav_screen.dart';
import 'package:expense_tracker/utils/common_utils.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';

class HomeScreen extends AbstractBottomNavScreen {
  @override
  final int pageIndex = 0;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * .25;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Image.asset(
          CommonUtils.getImageFromAsset("home_bg"),
          height: height,
          width: width,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
