import 'package:expense_tracker/cubits/home/home_cubit.dart';
import 'package:expense_tracker/screens/home/widgets/transaction_widget.dart';
import 'package:expense_tracker/utils/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) => p.transactions != c.transactions,
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();

        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: state.transactions.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: TransactionWidget(
                data: state.transactions[index],
              ),
            ).asButton(onTap: (){}),
          ),
        );
      },
    );
  }
}
