import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/models/payment_app_model.dart';
import 'package:flutter/services.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  late final MethodChannel channel;
  late final double amount;
  late final String description;

  ScannerCubit({
    required this.amount,
    required this.description,
  }) : super(const ScannerState()) {
    channel = const MethodChannel("zeeshan_upi_app");
    getAppsList();
  }

  void getAppsList() async {
    var result =
        await channel.invokeListMethod<Map<dynamic, dynamic>>('getPaymentsApp');
    var appList =
        result?.map((e) => PaymentAppModel.fromJson(e)).toList() ?? [];
    emit(state.copyWith(paymentApps: appList));
  }
}
