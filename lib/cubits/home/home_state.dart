part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<TransactionModel> transactions;

  @override
  List<Object?> get props => [transactions];

  const HomeState({
    this.transactions =const [],
  });

  HomeState copyWith({
    List<TransactionModel>? transactions,
  }) {
    return HomeState(
      transactions: transactions ?? this.transactions,
    );
  }
}
