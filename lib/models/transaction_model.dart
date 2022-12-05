class TransactionModel{
  final String id;
  final String timeStamp;
  final String merchantImage;
  final String title;
  final int amount;
  final bool isDebited;

  const TransactionModel({
    required this.id,
    required this.timeStamp,
    required this.merchantImage,
    required this.title,
    required this.amount,
    required this.isDebited,
  });

  factory TransactionModel.dummyModel(int index){
    return TransactionModel(id: index.toString(), timeStamp: "Jan 30, 2022", merchantImage: "paypal", title: "Upwork", amount: 850, isDebited: false);
  }
}