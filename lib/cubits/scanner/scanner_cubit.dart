import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/models/payment_app_model.dart';
import 'package:flutter/services.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  late final MethodChannel channel;
  late final double amount;
  late final String description;
  String qrCode = "";

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

  void onQrCodeDetected(String code) {
    print("zeeshan qrCode $code");
    // upi://pay?pa=9323332106@ybl&pn=Zeeshan&mc=0000&mode=02&purpose=00
    qrCode = code;
    emit(state.copyWith(qrCodeDetected: true));
  }

  void makePayment(PaymentAppModel paymentApp) async {
    var arguments = {
      "app": paymentApp.packageName,
      "qrCode":qrCode,
    };

    var result = await channel
        .invokeMethod<Map<String, String>>(
      'makePayment',
      arguments,
    )
        .catchError((error) {
      print("zeeshan error got $error");
    });
    print("zeeshan result got $result");
  }
}
