part of 'make_payment_cubit.dart';

class MakePaymentState extends Equatable {
  final double amount;
  final String description;
  final String msg;

  @override
  List<Object?> get props => [amount, description,msg,];

  const MakePaymentState({
    this.amount = 0,
    this.description = "",
    this.msg = "",
  });

  MakePaymentState copyWith({
    double? amount,
    String? description,
    String? msg,
  }) {
    return MakePaymentState(
      amount: amount ?? this.amount,
      description: description ?? this.description,
      msg: msg ?? this.msg,
    );
  }
}
