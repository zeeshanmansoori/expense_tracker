part of 'scanner_cubit.dart';

class ScannerState extends Equatable {
  final List<PaymentAppModel> paymentApps;
  final String msg;
  final bool qrCodeDetected;

  const ScannerState({
    this.paymentApps = const [],
    this.msg = "",
    this.qrCodeDetected = false,
  });

  @override
  List<Object?> get props => [
        paymentApps,
        msg,
        qrCodeDetected,
      ];

  ScannerState copyWith({
    List<PaymentAppModel>? paymentApps,
    String? msg,
    bool? qrCodeDetected,
  }) {
    return ScannerState(
      paymentApps: paymentApps ?? this.paymentApps,
      msg: msg ?? "",
      qrCodeDetected: qrCodeDetected ?? this.qrCodeDetected,
    );
  }
}
