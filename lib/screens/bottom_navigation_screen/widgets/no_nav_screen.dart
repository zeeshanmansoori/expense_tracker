import 'package:expense_tracker/screens/bottom_navigation_screen/widgets/abstract_bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class NoNavScreen extends AbstractBottomNavScreen {
  @override
  final int pageIndex = 2;

  const NoNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
