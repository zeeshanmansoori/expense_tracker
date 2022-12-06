class PaymentAppModel {
  final String appName;
  final String icon;
  final String packageName;
  final int preferredOrder;

  const PaymentAppModel({
    required this.appName,
    required this.packageName,
    required this.icon,
    required this.preferredOrder,
  });

  factory PaymentAppModel.fromJson(Map<dynamic, dynamic> map) {
    var packageName = map["packageName"];
    var icon = map["icon"];
    var appName = map["appName"];
    var preferredOrder = map["preferredOrder"];

    return PaymentAppModel(
      appName: appName,
      packageName: packageName,
      icon: icon,
      preferredOrder: preferredOrder
    );
  }
}
