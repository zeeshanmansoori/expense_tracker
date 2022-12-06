import 'package:expense_tracker/cubits/scanner/scanner_cubit.dart';
import 'package:expense_tracker/screens/scanner/widgets/payement_app_item_widget.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentAppListWidget extends StatelessWidget {
  const PaymentAppListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerCubit, ScannerState>(
      buildWhen: (p, c) => p.paymentApps != c.paymentApps,
      builder: (context, state) {
        var cubit = context.read<ScannerCubit>();

        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: state.paymentApps.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: PaymentAppItemWidget(
                data: state.paymentApps[index],
              ),
            ).paddingWithSymmetry(horizontal: 20).asButton(onTap: (){}),
          ),
        );
      },
    );
  }
}
