import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'make_payment_state.dart';

class MakePaymentCubit extends Cubit<MakePaymentState> {
  MakePaymentCubit() : super(const MakePaymentState());

  bool validateInput({bool displayError = false}) {
    clearErrorMsg();
    var isValid = state.amount != 0 && state.description.isNotEmpty;
    if (!isValid && displayError) {
      emit(state.copyWith(msg: "fields can not be empty."));
    }
    return isValid;
  }

  void clearErrorMsg() {
    emit(state.copyWith(msg: ""));
  }

  void onDescriptionChanged(String value) {
    clearErrorMsg();
    emit(state.copyWith(description: value));
  }

  void onAmountChanged(String value) {
    clearErrorMsg();
    emit(state.copyWith(amount: double.tryParse(value)));
  }
}
