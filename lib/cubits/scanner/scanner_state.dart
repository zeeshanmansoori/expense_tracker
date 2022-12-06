part of 'scanner_cubit.dart';



class ScannerState extends Equatable {
  final List<PaymentAppModel> paymentApps;

  const ScannerState({
     this.paymentApps = const [],
  });



  @override
  List<Object?> get props => [paymentApps];

  ScannerState copyWith({
    List<PaymentAppModel>? paymentApps,
  }) {
    return ScannerState(
      paymentApps: paymentApps ?? this.paymentApps,
    );
  }
}
