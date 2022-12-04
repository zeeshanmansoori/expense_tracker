import 'package:expense_tracker/screens/bottom_navigation_screen/widgets/abstract_bottom_nav_screen.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends AbstractBottomNavScreen {
  @override
  final int pageIndex = 1;

  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Statistics").wrapCenter();
  }
}
