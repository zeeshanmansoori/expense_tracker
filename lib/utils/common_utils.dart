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
    return "assets/nav_icons/$fileName${selected ? "_selected" : ""}.svg";
  }
}
