import 'package:flutter/material.dart';

class CommonUtils {
  static String getImageFromAsset(String assetName) {
    return "assets/images/$assetName.png";
  }

  static String getNavIconSvgPath(int index, {bool selected = false}) {
    var fileName = "";
    switch (index) {
      case 0:
        fileName = "home";
        break;
      case 1:
        fileName = "statistics";
        break;
      case 3:
        fileName = "wallet";
        break;
      case 4:
        fileName = "profile";
        break;
    }
    return "assets/svg/nav_icons/$fileName${selected ? "_selected" : ""}.svg";
  }

  static String getLottieAsset(String assetName) {
    return "assets/lottie/$assetName.json";
  }

  static void showSnackBar(BuildContext context, String? msg, {Duration? duration}) {
    if (msg == null || msg == "") return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(msg),
          behavior: SnackBarBehavior.floating,
          duration: duration ?? const Duration(milliseconds: 3000),
          //backgroundColor: Colors.red,
        ),
      );
  }
}
