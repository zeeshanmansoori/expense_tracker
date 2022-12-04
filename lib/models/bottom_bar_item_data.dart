import 'package:flutter/material.dart';


class BottomBarItemData {
  final String asset;
  final bool isSelected;
  final Widget content;

  BottomBarItemData({
    this.isSelected = false,
    required this.asset,
    required this.content,
  });
}
