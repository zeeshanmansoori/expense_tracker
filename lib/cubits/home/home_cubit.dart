import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/models/transaction_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    var list = List.generate(10, (index) => TransactionModel.dummyModel(index));
    emit(state.copyWith(transactions: list));
  }
}
