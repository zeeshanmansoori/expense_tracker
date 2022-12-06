import 'dart:convert';

import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    Key? key,
    this.size = 30,
    required this.imagePath,
    this.base64 = false,
  }) : super(key: key);
  final String imagePath;
  final double size;
  final bool base64;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CustomColors.alabaster,
        borderRadius: BorderRadius.circular(8),
      ),
      child: base64
          ? Image.memory(
              base64Decode(imagePath),
              width: size,
              height: size,
            )
          : Image.asset(
              imagePath,
              width: size,
              height: size,
            ),
    );
  }
}
